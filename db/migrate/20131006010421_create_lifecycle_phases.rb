class CreateLifecyclePhases < ActiveRecord::Migration
  def change
    create_table :lifecycle_phases do |t|
      t.string :name
      t.string :description
      t.integer :sequenceNumber

      t.timestamps
    end
  end
end
