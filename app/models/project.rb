# == project.rb
# A project is a collaborative product which consists of a series of plans
# that user defines to carry out the plans.
# This file contains the details of a project that user creates.
#
# It also includes the Project model definition with associations
# to different models (ProjectPhase and Lifecycle).
# One project is composed of the name of a project, the description,
# and the ID of a specific lifecycle that the project uses.
# === Fields:
# * Name: unique character string that identifies the Lifecycle (required)
# * Description: character string that explains the Lifecycle (optional)
# * lifecycle_id: a numeric ID used as a foreign key to locate a specific lifecycle (required)

class Project < ActiveRecord::Base
  # A project has many project phases within the project.
  has_many        :project_phases

  # A project belongs to the lifecycle.
  belongs_to      :lifecycle

  # A project can have a name, a description, and a lifecycle ID
  # used as a foreign key to refer to the Lifecycle model.
  attr_accessible :name, :description, :lifecycle_id
  # A project name is required to create a project.
  validates :name, presence:true
  # A project name must be unique across the whole database.
  validates :name, uniqueness:true

  # A project lifecycle_id is required to create a project.
  validates :lifecycle_id, presence:true

  after_create :create_project_phases

  def create_project_phases
    lifecyclePhases = LifecyclePhase.find_all_by_lifecycle_id(self.lifecycle_id)
    lifecyclePhases.each do |lifecyclePhase|
      ProjectPhase.create(project_id: self.id, lifecycle_phase_id: lifecyclePhase.id)
    end
  end
end
