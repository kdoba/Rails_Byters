class ProjectPhaseDeliverable < ActiveRecord::Base
  # To change this template use File | Settings | File Templates.
  attr_accessible :project_phase_id, :name, :description, :uom_id, :size, :rate, :complexity_id, :deliverable_type_id

  belongs_to :project_phase

  validates :project_phase_id, presence:true
  validates :name, presence:true
  validates :uom_id, presence:true
  validates :size, presence:true
  validates :rate, presence:true
  validates :complexity_id, presence:true
  validates :deliverable_type_id, presence:true

end