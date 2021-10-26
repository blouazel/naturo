class ContactformMailer < ApplicationMailer
  default from: 'justine.feuerstoss@just-o-naturel.com'
  def contactform(message)
    @message = message
    #  @email = email
    mail(to: 'justine.feuerstoss@just-o-naturel.com', subject: 'Nouveau message sur just-o-naturel.com')
  end
end
