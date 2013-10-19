class AlterProjectPhaseDeliverable < ActiveRecord::Migration
  def up
    remove_column   :project_phase_deliverables, :complexity_id
    add_column      :project_phase_deliverables, :complexity, :string
    change_column   :project_phase_deliverables, :size, :decimal
    add_column      :project_phase_deliverables, :effort, :decimal
  end

  def down
    add_column      :project_phase_deliverables, :complexity_id, :integer
    remove_column   :project_phase_deliverables, :complexity
    change_column   :project_phase_deliverables, :size, :integer
    remove_column   :project_phase_deliverables, :effort
  end
end
