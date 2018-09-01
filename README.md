# README

Rails 5.2 application.

Needs a MySQL database
`rails db:migrate`
`rails db:seed`

ENV['SECRET_KEY_BASE'] for secret key (in config/secret.yaml)



config/initializers/production.rb
---------------------------------

1. Static '/public'
Default behaviour is to disable serving static files from the `/public` folder.
Apache or NGINX already handles this.
Is configured as:
`config.public_file_server.enabled = ENV['RAILS_SERVE_STATIC_FILES'].present?`
Set ENV['RAILS_SERVE_STATIC_FILES'] to override default behaviour.

2. Logging
Is configured as:
`if ENV["RAILS_LOG_TO_STDOUT"].present?
  logger           = ActiveSupport::Logger.new(STDOUT)
  logger.formatter = config.log_formatter
  config.logger    = ActiveSupport::TaggedLogging.new(logger)
end`
Set ENV['RAILS_LOG_TO_STDOUT'] to enable logging to STDOUT.

3. Storage
Requires **persistent directory** `/storage`
Uses ActiveStorage with `storage.yaml`:
`local:
  service: Disk
  root: <%= Rails.root.join("storage") %>`

4. LDAP
Admin users sign in using Devise LDAP authenticatable.
ENV['DEVISE_LDAP_HOST'] default is `ldap`
ENV['DEVISE_LDAP_PORT'] default is `636`
ENV['DEVISE_LDAP_ADMIN_USERNAME'] default is `admin`
ENV['DEVISE_LDAP_ADMIN_PASSWORD'] default is `nil` - REQUIRED
