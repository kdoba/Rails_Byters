class ProjectPhase < ActiveRecord::Base
  belongs_to :project
  attr_accessible :lifecycle_phase_id, :project_id, :name

  validates :name, presence:true
end
