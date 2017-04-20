class ChargesController < ApplicationController
  def new
  #@contract_job = params[:contract_job_id]
  @contract_job_id = Contract.find_by_id(session[:contract_job_id])
  end

  def create
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
  
  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_charge_path
  end
end
