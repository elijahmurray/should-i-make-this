# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Application setup
Install foreman

`gem install foreman`

Note: This does not go in your `Gemfile`

* Rename application
`rails g rename:into My-App-Name`
`rake db:setup`
`rails generate simple_form:install --bootstrap`

Rename your database in `config/database.yml`


Run:
`foreman start -f Procfile.dev`

* Services (job queues, cache servers, search engines, etc.)
For faster development, this application uses a livereloader plugin with Chrome. [Read more about it here](https://github.com/guard/guard-livereload). This is entirely optional.

* Deployment instructions

Quick Start Heroku

`heroku apps:create myapp`
* ...
