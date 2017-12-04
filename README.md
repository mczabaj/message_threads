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

## Thoughts and considerations

The data model was an interesting one. It is clear to me know, that when I first started the problem, I did not understand the relationship between a message_thread and a message well.

At first, I had initially designed there a User model and a Message model, where the MessageThread model was just the table for the many to many relationships between users and messages. I quickly ran aground when trying to the index list for all message threads. I didn't have a unique id for each message_thread. In trying to derive one it became clear I was overcomplicating something that should have been much easier. A new model/relationship was needed

For my second pass at a model, I think I started out trying to be too clever. I realized from my first attempt that the message threads were unique, (1 to 1) to users. So, if I have a user and a user has messages then I have message_threads but just getting a user's messages. My "message thread" model wasn't going to be a table at all in the db, just a derived object model from users, their type (patient or doctor), and the messages for that patient. Again, I realized something was off when I was dealing with tring to create a nested route for a thread's messages in that I really needed a more concrete user_message relationship table (aka message_thread).

Finally, it hit me. A User has one message_thread. MessageThreads have many messages, specific to the thread. Once I saw it, it seemed so simple... you can easily crawl from a message up to a user through the thread or from a user to their messages. Additionally, by nesting the resources in the route file, and since messages belong to a thread, the paths of `message_threads/:thread_id/messages/:message_id` all fall in line nicely. In those first two attempts above, I was trying to write those nested routes from scratch with there already being the full CRUD resources routes available.

So... I knew this going in, and it shouldn't surprise me when I still do it, but taking a step back and really just thinking through the data model, maybe with a pen and paper and a picture or 3, will really get you going in the right direction faster. I think I just felt a little rushed being in the office and I put unneeded pressure on myself to get something working right away. I need to remember to have a little hammock time, think it out. then act.

Regrets:
Since I basically started and stopped the app 3 times, I didn't get into writing (or even fixed the scaffold created) any tests.

## Tests
* How to run the test suite
  run `rake test`
  *note: these currently fail*

## License

Copyright © 2017 Mike Czabaj
