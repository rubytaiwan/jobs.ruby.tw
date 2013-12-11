class JobsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :find_my_job, only: [:edit, :update, :destroy, :open, :close]

  # FIXME:
  # 現在 search 綁在 application.html.erb 裡，所以每個 action 都需要 @q，
  # 不然會噴：
  #   ArgumentError at /jobs/4-mad-rubyist-apple-inc
  #   No Ransack::Search object was provided to search_form_for!
  # 應該要把 view 拆開，目前暫時只能搜索 title。
  before_action :get_search_object

  def index
    @q = Job.search(params[:q])
    @jobs = if params[:user_id]
              User.find(params[:user_id]).jobs.recent
            elsif params[:q]
              @q.result(distinct: true)
            else
              Job.online.recent
            end
  end

  def show
    @job = Job.find(params[:id])

    set_page_title "#{@job.title} | #{@job.company_name} is hiring!"
    set_page_description @job.description
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
    @job = current_user.jobs.build(job_params)
    @job.created_at = Time.now
    @job.valid?

    render layout: false
  end

  def update
    if @job.update(job_params)
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

  def find_my_job
    @job = current_user.jobs.find(params[:id])
  end

  private

  def get_search_object
    @q = Job.search(params[:q])
  end

  def job_params
    params.require(:job)
      .permit(:title, :job_type, :occupation, :company_name,
              :location, :url, :description, :apply_information,
              :deadline)
  end
end
