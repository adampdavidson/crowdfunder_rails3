class ProjectsController < ApplicationController
	
	def index
    	@projects = Project.order('projects.created_at DESC').page(params[:page])
  	end

	def show
        @project = Project.find(params[:id])
  	end

  	def project_params
    	params.require(:title).permit(:teaser, :title, :description, :goal, :user_id)
  	end
end
