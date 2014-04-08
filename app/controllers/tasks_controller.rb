class TasksController < ApplicationController
	before_filter :authenticate_user!
	def index
		if params[:with] =="my_task"
		  @tasks = current_user.tasks.paginate(:page => params[:page], :per_page => 3).search(params[:search])
	  elsif params[:with] =="upcoming_task"
	  	@tasks = Task.find_by_task_status("Pending")
    elsif params[:with] =="completed_task"
	  	@tasks = Task.find_by_task_status("Working")
	  # elsif params[:with] == "project_tasks"
	  # 	debugger
	  # 	@project = Project.find(params[:project_id])
	  # 	@tasks = @project.tasks.paginate(:page => params[:page], :per_page => 3).search(params[:search])
		else
			@tasks = Task.paginate(:page => params[:page], :per_page => 3).search(params[:search])
    end
    @user = User.all
    @tasks = Task.paginate(:page => params[:page], :per_page => 3).search(params[:search])
    respond_to do |format|
    	format.js
    	format.html
    end
	end

	def new
		@task = Task.new
		# respond_to do |format|
  #     format.js
  #   end
	end

	def show
		@task = Task.find(params[:id])
	end

	def edit
		@task = Task.find(params[:id])
	end

	def create
		@project = Project.find(params[:task][:project_id])
		@task = @project.tasks.build(params[:task])
		@task = current_user.tasks.build(params[:task])
		respond_to do |format|
			debugger
			if @task.save
				format.js {redirect_to tasks_path}
				format.html{redirect_to tasks_path}
			else
				render 'new'
			end
		end
	end

	def update
		@task = Task.find(params[:id])
		if @task.update_attributes(:task)
			redirect_to task_path(@task)
		else
			render 'index'
		end
	end

	def destroy
		@task = Task.find(params[:id])
		if @task.delete
			redirect_to tasks_path
		else
			render 'index'
		end
	end
end
