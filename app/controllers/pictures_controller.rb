class PicturesController < ApplicationController
	def index
		@pictures = Picture.all
	end

	def new
		@picture = Picture.new
		respond_to do |format|
			format.js
		end
	end

	def create
		@project = Project.find(params[:project_id])
		@picture = @project.pictures.build(params[:picture])
		respond_to do |format|
			if @picture.save
				format.html { redirect_to projects_path, notice: 'Successfully Attached' }
        format.json { render json: @picture, status: :created, location: @picture }
			else
				format.html { render action: "new" }
        format.json { render json: @title.errors, status: :unprocessable_entity }
			end
		end
	end

	def destroy
		@picture = Picture.find(params[:id])
		if @picture.delete
			redirect_to projects_path
		else
			render 'index'
		end
	end

	def download_file
    @picture = Picture.find(params[:picture_id])
    send_file(@picture.attachment.path,
    	    :filename => @picture.attachment.file.filename,
	        :type => 'application/pdf',
	        :disposition => 'attachment',
	        :url_based_filename => true)
	  end
end
