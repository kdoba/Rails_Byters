class ProjectPhaseDeliverableController < ApplicationController

  # TODO: We should really refactor how we're calling globally used variables/resources
  def show
    @deliverable          = ProjectPhaseDeliverable.find(params[:id])
    @project_phase_id     = @deliverable.project_phase_id
    @complexities         = ProjectPhaseDeliverable.complexities

    @deliverable_types    = ProjectPhaseDeliverable.deliverable_types
    @units_of_measurement = ProjectPhaseDeliverable.units_of_measurement
  end

  def new
    @deliverable          = ProjectPhaseDeliverable.new
    @project_phase_id     = params[:project_phase_id]
    @complexities         = ProjectPhaseDeliverable.complexities

    @deliverable_types    = ProjectPhaseDeliverable.deliverable_types
    @units_of_measurement = ProjectPhaseDeliverable.units_of_measurement
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
      deliverable_type_id: params[:project_phase_deliverable][:deliverable_type_id],
      effort: 0 #dummy data since the model doesn't accept nil effort
    )

    if @new_project_phase_deliverable && @new_project_phase_deliverable.save
      flash[:success] = "New deliverable was successfully created"
      redirect_to '/project_phases/' + @new_project_phase_deliverable.project_phase_id.to_s
    end
  end
end
