# AMQP Messenger

This super simple tool allows you to easily subscribe to AMQP topics and send messages to them from the command line. The intention
is to make testing simpler and more repeatable.

## Usage

From the command line, to listen on a topic:

    $ bundle exec bin/listen [exchange name] [topic name]

and to send message to a topic. The message file should be one message per line.

    $ bundle exec bin/publish [exchange name] [topic name] [message file]
