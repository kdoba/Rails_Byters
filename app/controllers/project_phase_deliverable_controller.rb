class ProjectPhaseDeliverableController < ApplicationController
  def show
    @deliverable = ProjectPhaseDeliverable.find(params[:id])
  end

  def new
    @new_project_phase_deliverable = ProjectPhaseDeliverable.new
    @project_phase_id = params[:project_phase_id]
    # add some dummy data for testing
    @deliverable_types = ["Type 1", "Type 2", "Type 3"]
    @units_of_measurement = ["Words", "Pages", "Story Points", "Lines"]
    @complexities = ["Small", "Medium", "Large"]
  end

  def create
    @new_project_phase_deliverable = ProjectPhaseDeliverable.new(
                               project_phase_id: params[:project_phase_deliverable][:project_phase_id],
                               name: params[:project_phase_deliverable][:name],
                               description: params[:project_phase_deliverable][:description],
                               uom_id: params[:project_phase_deliverable][:uom_id],
                               size: params[:project_phase_deliverable][:size],
                               rate: params[:project_phase_deliverable][:rate],
                               complexity_id: params[:project_phase_deliverable][:complexity_id],
                               deliverable_type_id: params[:project_phase_deliverable][:deliverable_type_id])

    @new_project_phase_deliverable.save
    redirect_to 'project_phases/1'
  end
end
