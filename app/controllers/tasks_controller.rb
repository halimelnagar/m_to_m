class TasksController < ApplicationController
  # before_action :set_project, only: [:show, :edit, :update, :destroy]

	def index
     @project = Project.find(params[:project_id])
     @tasks = @project.tasks     
  end

  private
  def set_project
      @project = Project.find(params[:project_id])
    end
end