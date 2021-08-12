# README

Simple Rails application


For correct mailer work add config/env_vars.rb file with
ENV['MAILER_EMAIL'] = 'mail'
ENV['MAILER_PASSWORD'] = 'password'

For correct database work copy config/database.yml.template to config/database.yml and set credentials for db

To send mails with sidekiq, install redis and start sidekiq
```
bundle exec sidekiq --environment development -C config/sidekiq.yml
```

Some test text
Blablabla