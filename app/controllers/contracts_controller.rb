class ContractsController < ApplicationController
  before_action :nav_bar, only: [:index]
  
  def index
    @contracts = Contract.all.reverse_order
    @valid_contracts_array = []
    @contracts.each do |x|
      unless (x.expiration.nil? || (x.expiration >= (Time.now + 8.days)))
          @valid_contracts_array << x #[x.id, x.title, x.description, x.expiration] 
      end
    end
  end
  
  def new
    @contract_job = Contract.new
  end
  
  
  def show
    @contract_job = Contract.find(params[:id])
  end
  
  def create
    @contract_job = Contract.new(contract_job_params)
    if @contract_job.save
      session[:contract_job_id] = @contract_job.id
      redirect_to @contract_job
      flash[:success] = "Thanks for the Input!"
    else
      redirect_to contract_show_path(@contract_job)
      flash[:danger] = "Oops please enter something."
    end
  end
  
  def edit
    @contract_job = Contract.find(params[:id])
  end
  
  def update
    @contract_job = Contract.find(params[:id])
    if @contract_job.update(contract_job_params)
      redirect_to @contract_job
      flash[:success] = "Updated!"
    else
      render edit_contract_path
      flash[:alert] = "Please provide input!"
    end
  end
  
  def destroy
  end
  
  
  private
  
  def contract_job_params
    params.require(:contract).permit(:title, :description, :email)
  end
  
  def nav_bar
    @nav_bar = 'layouts/nav'
  end
end
