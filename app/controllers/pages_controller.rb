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
    ContactformMailer.contactform(params[:message]).deliver
  end
end
