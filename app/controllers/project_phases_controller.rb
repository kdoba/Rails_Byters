# * *Filename*    : project_phases_controller.rb
# * *Date*        : 09-30-2013
# * *Team*        : Rails Byters
# * *Description* : This controller provides an api to query and create project phases in PET
#
class ProjectPhasesController < ApplicationController

  def show
    @project_phase = ProjectPhase.find(params[:id])
  end
end
