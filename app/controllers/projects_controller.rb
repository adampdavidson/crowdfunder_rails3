class ProjectsController < ApplicationController
	
	def index
    	@projects = Project.all
  	end

	# def show
 #        @project = Project.find(params[:id])
 #  	end

  	def project_params
    	params.require(:title).permit(:teaser, :title, :description, :goal, :user_id)
  	end
end
