class ChargesController < ApplicationController
  def new
  #@contract_job = params[:contract_job_id]
  @contract_job_id = Contract.find_by_id(session[:contract_job_id])
  end

  def create
    begin
    # Amount in cents
    @amount = 1999
  
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
      @paid = Contract.find(session[:contract_job_id])
      @paid.update(expiration: "#{Time.now + 8.days}")
    end
    
  
    rescue Stripe::CardError => e
      flash[:error] = e.message
      redirect_to charges_path
    end
  end
end
