class GuestMailer < ApplicationMailer
  default from: 'test.tost.holo@gmail.com'

  def purchase_email(guest, image)
    @image = image
    mail(to: guest.email, subject: 'Successful purchase')
  end
end
