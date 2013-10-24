# == LifecyclePhase.rb
# Thie file contains the specific processes used in each specific Lifecycle.
# Each Lifecycle consists of a set of phases (or plans) for user to carefully follow
# in order to complete the Project that uses the specific Lifecycle.
# === Fields:
# * Name: unique character string that identifies the Lifecycle (required)
# * Description: character string that explains the Lifecycle (optional)
# * lifecycle_id: a numeric ID used as a foreign key to locate a specific lifecycle (required)
# === Required by:
# * ProjectPhase
# === Notes:
# * Non editable in PET 1.1


class LifecyclePhase < ActiveRecord::Base
  attr_accessible :description, :name, :sequenceNumber
  validates :name, presence:true
  validates :sequenceNumber, presence:true
  belongs_to :lifecycle
  has_many :deliverable_types
end
