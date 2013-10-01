class AddLifecycleToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :lifecycle_id, :integer
  end
end
