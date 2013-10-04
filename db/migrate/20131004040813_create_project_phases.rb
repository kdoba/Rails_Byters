class CreateProjectPhases < ActiveRecord::Migration
  def change
    create_table :project_phases do |t|
      t.integer :lifecycle_phase_id
      t.integer :project_id

      t.timestamps
    end
  end
end
