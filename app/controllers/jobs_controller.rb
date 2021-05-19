class JobsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :find_my_job, only: [:edit, :update, :destroy, :open, :close]

  def index
    if params[:user_id]
      @jobs = User.find(params[:user_id]).jobs.recent
    elsif params[:keyword]
      @jobs = Job.online.search(params[:keyword])
    else
      @jobs = Job.online.recent
    end
  end

  def show
    @job = Job.find(params[:id])

    @page_title = "#{@job.title} | #{@job.company_name} is hiring! « Ruby Jobs in Taiwan"
    @page_description = @job.description
    
  end

  def new
    @job = current_user.jobs.build
    @job.deadline = Time.zone.now + 90.days
  end

  def create
    @job = current_user.jobs.build(job_params)

    if @job.save
      redirect_to job_path(@job)
    else
      render :new
    end
  end

  def edit
  end

  def preview
    @job = current_user.jobs.build(params[:job])
    @job.created_at = Time.now
    @job.valid?

    render layout: false
  end

  def update
    if @job.update_attributes(job_params)
      redirect_to job_path(@job)
    else
      render :edit
    end
  end

  def destroy
    @job.destroy

    redirect_to jobs_path
  end

  def open
    @job.open
    @job.save!

    redirect_to job_path(@job)
  end

  def close
    @job.close
    @job.save!

    redirect_to job_path(@job)
  end

  protected

  def job_params
    params.require(:job).permit(:title, :job_type, :occupation, :company_name, :location, :url, :description, :apply_information, :deadline, :user_id, :deadline_forever)
  end

  def find_my_job
    @job = current_user.jobs.find(params[:id])
  end
end
