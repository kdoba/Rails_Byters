class CreateDeliverableTypes < ActiveRecord::Migration
  def change
    create_table :deliverable_types do |t|
      t.string :name
      t.integer :lifecycle_phase_id
      t.integer :uom_id

      t.timestamps
    end
  end
end
