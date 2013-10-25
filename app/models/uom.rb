class Uom < ActiveRecord::Base
  attr_accessible :name
  has_many :deliverable_types
  has_many :project_phase_deliverables

  def self.getAllForSelect
    Uom.all.map {|uom| [uom.name, uom.id] }
  end
end
