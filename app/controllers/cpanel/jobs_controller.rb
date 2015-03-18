class Cpanel::JobsController < ApplicationController
  layout 'cpanel' 
  before_action :admin_only

  def index
    if params[:user_id]
      @jobs = User.find(params[:user_id]).jobs.recent
    elsif params[:keyword]
      @jobs = Job.online.search(params[:keyword])
    else
      @jobs = Job.online.recent
    end
  end

  def destroy
    @jobs = Job.find(params[:id])
    @jobs.destroy
    redirect_to cpanel_jobs_path, :alert => '職缺已刪除'
  end

  private
  def admin_only
    redirect_to root_path unless current_user && current_user.role.name == 'admin'
  end

end