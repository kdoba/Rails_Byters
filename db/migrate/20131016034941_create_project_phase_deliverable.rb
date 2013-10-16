class CreateProjectPhaseDeliverable < ActiveRecord::Migration
  def change
    create_table :project_phase_deliverables do |t|
      t.integer :project_phase_id
      t.string :name
      t.string :description
      t.integer :uom_id
      t.integer :size
      t.decimal :rate
      t.integer :complexity_id
      t.integer :deliverable_type_id

      t.timestamps
    end
  end
end
