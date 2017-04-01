class ContactsController < ApplicationController
  before_action :nav_bar
  
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
end
