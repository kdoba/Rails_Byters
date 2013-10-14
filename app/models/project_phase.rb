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
  attr_accessible :lifecycle_phase_id, :project_id

  validates :lifecycle_phase_id, :project_id, presence: true

  def name
    @lifecycle_phase_names = ["Requirements", "Design", "Implementation", "Verification", "Maintenance"]

    @lifecycle_phase_names[lifecycle_phase_id]
  end
end
