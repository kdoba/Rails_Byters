class DeliverableType < ActiveRecord::Base
  attr_accessible :lifecycle_phase_id, :name, :uom_id
  belongs_to :lifecycle_phase
  has_many :project_phase_deliverables
  belongs_to :uom
end
