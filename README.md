# README

Rails 5.2 application.

Needs a MySQL database
`rails db:migrate`
`rails db:seed`

Public at '/public'

ENV['RAILS_MASTER_KEY'] for secret key

NOT THIS > Cron job every 5 minutes `rails runner "ScheduleQuizzesJob.perform_now"`




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
