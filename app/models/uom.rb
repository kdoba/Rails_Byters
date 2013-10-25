class Uom < ActiveRecord::Base
  attr_accessible :name
  has_many :deliverable_types
  has_many :project_phase_deliverables
end
