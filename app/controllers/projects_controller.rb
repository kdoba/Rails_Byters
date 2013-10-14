# * *Filename*    : projects_controller.rb
# * *Date*        : 09-30-2013
# * *Team*        : Rails Byters
# * *Description* : This controller provides a REST api to query, create, and modify projects in PET
#
class ProjectsController < ApplicationController

  # This function joins project table with lifecycle table and returns a list of all projects
  # with matching lifecycle information
  # * *Http*  :
  #   - <tt>GET /projects</tt>
  def index
    @projects = Project.joins(:lifecycle)
  end

  # This function returns a project with a given id and its matching lifecycle information
  # * *Http*  :
  #   - <tt>GET /projects/1</tt>
  def show
    @project_phases = ProjectPhasesController.getProjectPhases(params[:id])
    @project = Project.joins(:lifecycle).find(params[:id])
  end

  # This function accept a json string as parameters for a new project and attempt to create
  # a new project in the database.
  # * *Args*    :
  #   - <tt>name:string</tt> - the name of the project
  #   - <tt>description:string</tt> - the description string of the project
  #   - <tt>lifecycle_id:number</tt> - the id of the project lifecycle
  # * *Returns* :
  #   - if successful: redirects to project overview page and flash success message
  #   - if unsuccessful: redirects to new project form and flash error message
  # * *Http*    :
  #   - <tt>POST /projects</tt>
  def create
    @new_project = Project.new(name: params[:project][:name],
                               description: params[:project][:description],
                               lifecycle_id: params[:project][:lifecycle_id])

    if @new_project && @new_project.save
      flash[:success] = "Project was successfully created"
      redirect_to @new_project
    else
      flash.now[:alert] = "Please fix the following errors."

      # /projects/new needs @lifecycles to render
      @lifecycles = Lifecycle.all
      render :new
    end
  end

  # This function gets a list of all lifecycles in lifecycle table and renders the new project html form
  # * *Http*  :
  #   - <tt>GET /projects/new</tt>
  def new
    @new_project = Project.new
    @lifecycles  = Lifecycle.all
  end

end
