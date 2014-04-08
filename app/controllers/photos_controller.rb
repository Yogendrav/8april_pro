class PhotosController < ApplicationController
	def index
		@photos = Photo.all
	end

	def new
		@photo = Photo.new
		respond_to do |format|
			format.js
		end
	end

	def create
		@task = Task.find(params[:task_id])
		@photo = @task.photos.build(params[:photo])
		respond_to do |format|
			if @photo.save
				format.html { redirect_to tasks_path, notice: 'Successfully Attached' }
        format.json { render json: @photo, status: :created, location: @photo }
			else
				format.html { render action: "new" }
        format.json { render json: @photo.errors, status: :unprocessable_entity }
			end
		end
	end

	def destroy
		@photo = Photo.find(params[:id])
		if @photo.delete
			redirect_to tasks_path
		else
			render 'index'
		end
	end

	def download_task_file
    @photo = Photo.find(params[:photo_id])
    send_file(@photo.document.path,
    	    :filename => @photo.document.file.filename,
	        :type => 'application/pdf',
	        :disposition => 'attachment',
	        :url_based_filename => true)
	  end
end
