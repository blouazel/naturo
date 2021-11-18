class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :about, :services, :contact, :send_contact]

  def home
  end

  def about
  end

  def services
  end

  def contact
  end

  def send_contact
    nom = params[:nom]
    email = params[:email]
    message = params[:message]
    ContactformMailer.contactform(message, email, nom).deliver
    redirect_to services_path, notice: 'Votre message a bien été envoyé !'
  end
end
