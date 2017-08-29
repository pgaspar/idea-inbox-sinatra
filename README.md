# Idea Inbox 📬 -- Sinatra edition

Idea Inbox 📬 is a simple example web app that prompts the user for ideas around a topic and allows them to add their own idea and vote in previously suggested ideas.

It serves as an example application for people to try out new languages and frameworks.

## Idea Inbox 📬 basics

At its simplest, the app consists of a input box users can use to submit new ideas and a list of submitted ideas. Ideas can additionally be voted up or down (preferably through Ajax, if building a web app), and the list should be ordered by vote score.

The app should also have an authenticated admin section that lists all submitted ideas and allows admins to delete entries. Here the list should be paginated and ideally sortable by either vote score or submission date.

The thing I like about playing with an app like this is that it's very open ended. You'll find yourself with a lot of ideas on how to improve the app and make it more complex, giving you a reason to continue exploring your new environment.

Here's some ideas:

* Allow users to comment on ideas
* Add infinite scroll to the idea list
* Add a mechanism to prevent users to vote in the same idea more than once (ex: using the session, storing the user's IP, etc...)
* Add user accounts and keep track of what each user votes in - from here you can add user profiles, or whatever you want
* If you add user accounts, have some sort of admin account and only allow those accounts to access the Admin section
* Add "Topics" to the system and make it so each topic can have N associated ideas. Allow admins to manage topics.
* Integrate with other services and make it so a Slack message or email is sent every time a new idea is submitted
* Add idea tags and use them to group ideas

## Sinatra edition stack

This Idea Inbox 📬 edition is built on Sinatra. This was actually the first version, since the project was originally based on oquefaltaemcoimbra.pt (pgaspar/oqfc) which was also built in Sinatra some years ago.

* Ruby 2.3.1
* Sinatra 2.0.0
* DataMapper 1.2.0
* jQuery
* Bootstrap 2.1.1

## Contributing

I'm still discovering Idea Inbox 📬 and I'd be very excited to do it with other people!

I'll be pushing a few other implementations soon(ish) as I explore other technologies, but please share your implementations as well!

Comments, suggestions, other implementations, etc. will be very welcome.

## Acknowledgments

Idea Inbox 📬 is based on oquefaltaemcoimbra.pt (pgaspar/oqfc), the work of a few Coimbra residents on the look for ideas of how to improve their city.

The idea of building the same app using multiple languages / frameworks comes from various other projects, like TodoMVC.
