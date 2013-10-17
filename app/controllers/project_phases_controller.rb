# * *Filename*    : project_phases_controller.rb
# * *Date*        : 09-30-2013
# * *Team*        : Rails Byters
# * *Description* : This controller provides an api to query and create project phases in PET
#
class ProjectPhasesController < ApplicationController

  def show
    @project_phase = ProjectPhase.find(params[:id])
    @project_phase_deliverables = ProjectPhaseDeliverable.find_all_by_project_phase_id(@project_phase.id)
  end
end
