class ProjectPhaseDeliverableController < ApplicationController
  def show
    @project_phase_deliverable = ProjectPhaseDeliverable.find(params[:id])
  end
end
