class RemoveNameFromProjectPhase < ActiveRecord::Migration
  def up
    remove_column :project_phases, :name
  end

  def down
    add_column :project_phases, :name, :string
  end
end
