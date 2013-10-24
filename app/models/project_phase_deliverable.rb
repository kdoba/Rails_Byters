class ProjectPhaseDeliverable < ActiveRecord::Base
  # To change this template use File | Settings | File Templates.
  attr_accessible :project_phase_id, :name, :description, :uom_id, :size, :rate, :complexity_id, :deliverable_type_id, :effort

  belongs_to :project_phase

  validates :project_phase_id,    presence:true
  validates :name,                presence:true
  validates :uom_id,              presence:true
  validates :size,                presence:true
  validates :rate,                presence:true
  validates :complexity_id,       presence:true
  validates :deliverable_type_id, presence:true
  validates :effort,              presence:true

  @@complexities = {1 => "Simple", 2 => "Medium", 3 => "Complex"}

  # add some dummy data for testing
  @@deliverable_types = {1 => "Type 1", 2 => "Type 2", 3 => "Type 3"}
  @@units_of_measurement = {1 => "Words", 2 => "Pages", 3 => "Story Points", 4 => "Lines"}

  def self.complexities
    @@complexities
  end

  def complexity_string
    @@complexities[complexity_id]
  end


  def self.deliverable_types
    @@deliverable_types
  end

  def deliverable_type_string
    @@deliverable_types[deliverable_type_id]
  end


  def self.units_of_measurement
    @@units_of_measurement
  end

  def uom_string
    @@units_of_measurement[uom_id]
  end

end