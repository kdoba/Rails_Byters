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
    @new_project = Project.new(name: params[:project][:name],
                               description: params[:project][:description],
                               lifecycle_id: params[:project][:lifecycle_id])
    if @new_project && @new_project.save
      flash[:success] = "Project was successfully created"
      redirect_to @new_project
    else
      flash[:alert] = "Project was NOT created"
      render action:"new"
    end
  end

  def new
    @project    = Project.new
    @lifecycles = Lifecycle.all
  end

end
