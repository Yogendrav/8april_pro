class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :project_new_modal
  before_filter :project_displaying
  before_filter :task_new_modal

  def project_new_modal
  	@project = Project.new
    @users = User.all
  end

  def task_new_modal
    @task = Task.new
  end

  def project_displaying
  	@projects = Project.all
  end
end
