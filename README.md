# README

This is a simple web app that allows users to correspond to each other in a
message thread.
Users can view all threads and see how many unread messages there are. A user can
also mark all messages in a thread as read.
Once in a thread, users can create new messages on that thread.

## Dependencies
* Ruby version
  `ruby 2.4.1p111`

* Rails version
  `Rails 5.1.4`

* Database creation and initialization
  The application is using SQLite3
  Run `rake db:create`

  Then `rake db:migrate` if your clone did not pull the dev.sqlite3 file

## Running
* Web Server
  Run `sails server`

  Navigate to `localhost:3000`

## Developing

Available Endpoints for purposes of the challenge:
*note: add `.json` to the end of request for json repsonse, otherwise you'll get the view html*

* GET /message_threads
    Returns a list of threads with
      id: int, unread: int (the number of unread messages in the thread)

* PATCH /message_threads/{id}
    (no params should be passed)
    Marks the messages in the thread as read

* GET /message_threads/{id}/messages
    Returns a list of messages in the thread. responds with:
      id: int (of the message), content: string, author: string

* GET /message_threads/{message_thread_id}/messages/{message_id}
    Returns message attributes

* POST /message_threads/{message_thread_id}/messages/{message_id}
          Parameter: { content: string }
    This POST will update the message content for a specific message within a thread

## Tests
* How to run the test suite
  run `rake test`


## License

Copyright © 2017 Mike Czabaj
