if Rails.env != 'test'
  ActionMailer::Base.smtp_settings = {
    address: 'smtp.gmail.com',
    port: 587,
    authentication: 'plain',
    user_name: ENV["MAILER_EMAIL"],
    password: ENV["MAILER_PASSWORD"],
    enable_starttls_auto: true
  }
  ActionMailer::Base.perform_deliveries = true
  ActionMailer::Base.raise_delivery_errors = true
end