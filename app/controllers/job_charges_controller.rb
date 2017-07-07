class JobChargesController < ApplicationController
  before_action :nofollow
  
  def new
    @job_id = Job.find_by_id(session[:job_id])
  end
  
  def create
    begin
    # Amount in cents
    @amount = 19900
  
    customer = Stripe::Customer.create(
    :email => params[:stripeEmail],
    :source  => params[:stripeToken]
    )
  
    charge = Stripe::Charge.create(
      :customer    => customer.id,
      :amount      => @amount,
      :description => 'Rails Stripe customer',
      :currency    => 'usd'
    )
    
    if charge["paid"] == true
      @paid = Job.find(session[:job_id])
      @paid.update(expiration: "#{Time.now + 31.days}")
    end
    
  
    rescue Stripe::CardError => e
      flash[:error] = e.message
      redirect_to charges_path
    end
    @job_id = Job.find(session[:job_id])
  end
  
  def invoice
    @job_id = Job.find(session[:job_id])
  end
  
  private
  
  def nofollow
    @nofollow = 1
  end  
  
  
  
end
