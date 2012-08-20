require "bunny"
require "digest/sha2"
require "date"
require "json"

class Messenger
  def initialize(exchange, topic)
    @exchange = exchange
    @topic = topic
    client.start
  end

  def listen
    queue = client.queue(Digest::SHA2.hexdigest(DateTime.now.strftime))
    queue.bind(exchange, :key => @topic)
    queue.subscribe do |message|
      p message[:delivery_details][:routing_key]
      p message[:payload]
    end
  end

  def send(message)
     exchange.publish(message, :key => @topic)
  end

  private
  def client
    @client ||= Bunny.new ENV['AMQP']
  end

  def exchange
    client.exchange(@exchange, :type => :topic)
  end
end
