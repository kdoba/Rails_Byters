class RenameComplexityToComplexityIdInProjectPhaseDeliverable < ActiveRecord::Migration
  def up
    add_column      :project_phase_deliverables, :complexity_id, :integer
    remove_column   :project_phase_deliverables, :complexity
  end

  def down
    remove_column   :project_phase_deliverables, :complexity_id
    add_column      :project_phase_deliverables, :complexity, :string
  end
end
