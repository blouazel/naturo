class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :about, :services, :contact]

  def home
  end

  def about
  end

  def services
  end

  def contact
  end

  def send_contact
    ContactMailer.contact(params[:message]).deliver
  end
end
