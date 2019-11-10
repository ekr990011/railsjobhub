class ContactsController < ApplicationController
  before_action :nav_bar
  before_action :location_tab
  before_action :g_ads

  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)

    @contact.save
    redirect_to '/'
  end


  private

  def contact_params
    params.require(:contact).permit(:email, :name, :text)
  end

  def nav_bar
    @nav_bar = 'layouts/nav'
  end

  def location_tab
    @location_tab = 'Contacts'
  end

  def g_ads
    @g_ads = false
  end
end
