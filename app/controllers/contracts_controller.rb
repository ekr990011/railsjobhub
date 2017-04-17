class ContractsController < ApplicationController
  
  def index
  
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
    
      redirect_to @contract_job
      flash[:success] = "Thanks for the Input!"
    else
      redirect_to contract_show_path(@contract_job)
      flash[:danger] = "Oops please enter something."
    end

  #   @contract_job = Contract.new(params[:contract_job_params])
  #   if @contract_job.save!
  #   render @contract_job
  #   else
  #     # flash[:notice] = "Successfully created project."
  #     # @contract_job.save
  #     # redirect_to contract_preview_path(@contract_job)
  #   end
  
  end
  
  
  # def preview
  #   @contract_job = Contract.find(params[:id])
  # end
  
  
  
  
  
  #only admin
  def edit
    @contract_job = Contract.find(params[:id])
  end
  
  def update
    
  end
  
  def destroy
  end
  
  
  private
  
  def contract_job_params
    params.require(:contract).permit(:title, :description, :email)
  end
  
end
