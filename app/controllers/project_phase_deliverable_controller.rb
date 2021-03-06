class ProjectPhaseDeliverableController < ApplicationController

  # TODO: We should really refactor how we're calling globally used variables/resources

  def show
    @deliverable          = ProjectPhaseDeliverable.find(params[:id])
    @project_phase_id     = @deliverable.project_phase_id
    getDeliverableTypes()
    @uoms = Uom.getAllForSelect
  end

  def new
    @project_phase_id     = params[:project_phase_id]

    if @project_phase_id.nil? || @project_phase_id.empty?
      flash[:alert] = "Please specify project phase id in order to create new deliverable."
      redirect_to '/projects'
    else
      @deliverable          = ProjectPhaseDeliverable.new
      getDeliverableTypes()
      @uoms = Uom.getAllForSelect
    end
  end

  def create

    @project_phase_id     = params[:project_phase_deliverable][:project_phase_id]

    if @project_phase_id.nil? || @project_phase_id.empty?
      flash[:alert] = "Please specify project phase id in order to create new deliverable."
      redirect_to '/projects'
    else
      @deliverable = ProjectPhaseDeliverable.new(
        project_phase_id:  @project_phase_id,
        name: params[:project_phase_deliverable][:name],
        description: params[:project_phase_deliverable][:description],
        uom_id: params[:project_phase_deliverable][:uom_id],
        size: params[:project_phase_deliverable][:size],
        rate: params[:project_phase_deliverable][:rate],
        complexity_id: params[:project_phase_deliverable][:complexity_id],
        deliverable_type_id: params[:project_phase_deliverable][:deliverable_type_id],
        effort:  params[:project_phase_deliverable][:effort]
      )

      if @deliverable && @deliverable.save
        flash[:success] = "New deliverable was successfully created"
        redirect_to '/project_phases/' + @deliverable.project_phase_id.to_s
      else
        flash[:alert] = "Please fix the following errors."
        getDeliverableTypes()
        @uoms = Uom.getAllForSelect
        render :new
      end
    end
  end

  # Get deliverable types by lifecycle phase ID
  # Helper method, not intended to be called from outside
  # Populates @deliverableTypes with deliverable types for lifecycle phase
  # Populates @deliverableTypesArray with deliverable type names keyed by deliverable type IDs
  def getDeliverableTypes
    @projectPhase = ProjectPhase.find(@project_phase_id)
    @deliverableTypes = DeliverableType.find_all_by_lifecycle_phase_id(@projectPhase.lifecycle_phase_id)
    @deliverableTypesArray = []
    @deliverableTypes.each do |type|
      @deliverableTypesArray.append([type.name,type.id])
    end
  end
end
