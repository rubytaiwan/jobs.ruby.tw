class JobsController < ApplicationController
  
  before_filter :authenticate_user!, :only => [:new, :create, :edit, :update, :destroy]
  
  def index
    if params[:user_id]
      @jobs = User.find(params[:user_id]).jobs.order("id desc")
    else
      @jobs = Job.order("id desc")
    end
    
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
  
  def edit
    @job = current_user.jobs.find(params[:id])
  end
  
  def update
    @job = current_user.jobs.find(params[:id])
    
    if @job.update_attributes(params[:job])
      redirect_to job_path(@job)
    else
      render :action => :edit
    end    
  end
  
  def destroy
    @job = current_user.jobs.find(params[:id])
    @job.destroy
    
    redirect_to jobs_path
  end
  
end
