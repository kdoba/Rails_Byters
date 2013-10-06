class AddNameToProjectPhase < ActiveRecord::Migration
  def change
    add_column :project_phases, :name, :string
  end
end
