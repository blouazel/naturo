class ContactMailer < ApplicationMailer
  default from: "justine.feuerstoss@just-o-naturel.com"
  def contact(message)
    @message = message
    mail(to: 'briac@rado2loc.com', subject: 'Nouveau contact sur just-o-naturel.com')
  end
end
