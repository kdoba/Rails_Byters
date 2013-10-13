class Project < ActiveRecord::Base
  has_many        :project_phases
  belongs_to      :lifecycle
  attr_accessible :name, :description, :lifecycle_id
  validates :name, presence:true
  validates :name, uniqueness:true

  #def lifecycle_string
  #  # added dummy lifecycle table
  #  @lifecycle_table = ["Agile", "Waterfall", "Simple Waterfall", "Extreme Programming"]
  #
  #  @lifecycle_table[lifecycle_id]
  #end
end
