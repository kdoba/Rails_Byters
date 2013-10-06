class AddLifecycleIdToLifecyclePhases < ActiveRecord::Migration
  def change
    add_column :lifecycle_phases, :lifecycle_id, :integer
  end
end
