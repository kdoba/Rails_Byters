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
    if @new_project && @new_project.save
      flash[:success] = "Project was successfully created"
      render action:"show"
    else
      flash[:error] = "Project was NOT created"
      render action:"new"
    end
  end

  def new

  end

end
