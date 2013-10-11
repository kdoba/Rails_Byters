class ProjectsController < ApplicationController

  #GET /projects
  def index
    @projects = Project.all
  end

  #GET /projects/1
  def show
    @project = Project.find(params[:id])
    @project_phases = ProjectPhasesController.getProjectPhases(params[:id])
  end

  #POST /projects
  def create
    @new_project = Project.new(name: params[:name], description: params[:description])
    @new_project.save
    render action:"show"
  end

  def new

  end

end
