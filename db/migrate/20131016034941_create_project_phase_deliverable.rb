class CreateProjectPhaseDeliverable < ActiveRecord::Migration
  def change
    create_table :project_phase_deliverables do |t|
      t.integer :project_phase_id, null: false
      t.string  :name, null: false
      t.string  :description
      t.integer :uom_id, null: false
      t.decimal :size
      t.decimal :rate
      t.decimal :effort
      # sqlite 3 does not support ENUM; instead of trying to figure out how to add ENUM type,
      # we decided to have :complexity as string and limit the selection from UI.
      t.string  :complexity, null: false
      t.integer :deliverable_type_id

      t.timestamps
    end
  end
end