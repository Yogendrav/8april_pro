class TaskCommentsController < ApplicationController
	def index
		@task_comments = TaskComment.all
	end

	def new
		@task_comment = TaskComment.new
		respond_to do |format|
			format.js
		end
	end

	def create
		@task = Task.find(params[:task_id])
		@task_comment = @task.task_comments.build(params[:task_comment])
		if @task_comment.save
			redirect_to tasks_path
		else
			render "new"
		end
	end
end
