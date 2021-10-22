class ContactformMailer < ApplicationMailer
  default from: 'justine.feuerstoss@just-o-naturel.com'
  def contactform(nom)
    @nom = nom
    @mail = mail
    @texte = texte
    mail(to: 'justine.feuerstoss@just-o-naturel.com', subject: 'Nouveau message sur just-o-naturel.com')
  end
end
