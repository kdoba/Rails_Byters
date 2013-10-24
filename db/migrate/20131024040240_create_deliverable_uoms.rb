class CreateDeliverableUoms < ActiveRecord::Migration
  def change
    create_table :deliverable_uoms do |t|
      t.string :name

      t.timestamps
    end
  end
end
