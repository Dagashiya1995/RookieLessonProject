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

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
## Create
bundle exec rails generate controller names
bundle exec rails generate model name

## Change Gemfile
bundle install

## Change migrate
rake db:migrate:reset

## Run PostgreSQL
pg_ctl -D data/ start

## stop PostgreSQL
pg_ctl -D data/ stop


