class AdminMailer < ApplicationMailer
  default from: 'test.tost.holo@gmail.com'

  def success_purchase_email(id)
    @id = id
    mail(to: Admin.pluck(:email), subject: 'Notification about successful purchase')
  end

  def error_purchase_email(email)
    @email = email
    mail(to: Admin.pluck(:email), subject: 'Notification about unsuccessful purchase')
  end
end
