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

  # Below code is commented out for the future use?
  #def lifecycle_string
  #  # added dummy lifecycle table
  #  @lifecycle_table = ["Agile", "Waterfall", "Simple Waterfall", "Extreme Programming"]
  #
  #  @lifecycle_table[lifecycle_id]
  #end
end
