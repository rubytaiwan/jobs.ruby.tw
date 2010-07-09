class JobsController < ApplicationController
  
  before_filter :authenticate_user!, :only => [:new, :create, :edit, :update, :destroy]
   
  def index
    @jobs = Job.order("id desc")
  end
  
  def show
    @job = Job.find(params[:id])
  end
  
  def new
    @job = current_user.jobs.build
  end
  
  def create
    @job = current_user.jobs.build(params[:job])
    
    if @job.save
      redirect_to job_path(@job)
    else
      render :action => :new
    end
    
  end
  
end
