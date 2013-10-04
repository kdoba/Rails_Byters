class Project < ActiveRecord::Base
  has_many        :project_phases
  attr_accessible :name, :description, :lifecycle_id

  def lifecycle_string
    # added dummy lifecycle table
    @lifecycle_table = ["Agile", "Waterfall", "Simple Waterfall", "Extreme Programming"]

    @lifecycle_table[lifecycle_id]
  end
end
