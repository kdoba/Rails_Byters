class ProjectsController < ApplicationController

  def index
    @projects = Project.all
  end

  def show
    @project = Project.find(params[:id])
    @project_phases = ProjectPhasesController.getProjectPhases(params[:id])
  end

end
