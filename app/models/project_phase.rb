# == ProjectPhase.rb
# A series of ProjectPhase, when a specific Lifecycle is chosen within a Project,
# is automatically generated from the LifecyclePhase model that the Lifecycle of a Project contains.
# This file includes the details of ProjectPhases: the references to both a Project
# that ProjectPhase are a part of, and a LifecyclePhase that the Lifecycle defined consists of.
# === Fields:
# * project_id: unique numeric ID that refers to the associated Project (required)
# * lifecycle_phase_id: unique numeric ID that refers to the associated LifecyclePhase (required)

class ProjectPhase < ActiveRecord::Base
  belongs_to :project
  belongs_to :lifecycle_phase

  has_many :project_phase_deliverables

  attr_accessible :lifecycle_phase_id, :project_id
  validates :lifecycle_phase_id, :project_id, presence: true

  def name
    self.lifecycle_phase.name
  end
end
