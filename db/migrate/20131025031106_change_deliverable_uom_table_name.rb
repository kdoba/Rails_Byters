class ChangeDeliverableUomTableName < ActiveRecord::Migration
  def up
    rename_table :deliverable_uoms, :uoms
  end

  def down
    rename_table :uoms, :deliverable_uoms
  end
end
