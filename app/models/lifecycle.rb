# == lifecycle.rb
# This file contains the specific structure of the process of
# software development. Lifecycle has one to many LifecyclePhase.
# === Fields:
# * Name: unique character string that identifies the Lifecycle (required)
# * Description: character string that explains the Lifecycle (optional)
# === Required by:
# * LifecyclePhase
# * Project
# * Historical Data
# === Notes:
# * Non editable in PET 1.1

class Lifecycle < ActiveRecord::Base
  has_many :lifecycle_phases
  has_many :projects
  attr_accessible :description, :name
  validates :name, presence:true, uniqueness:true
end
