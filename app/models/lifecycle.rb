class Lifecycle < ActiveRecord::Base
  has_many :lifecycle_phases
  attr_accessible :description, :name
  validates :name, presence:true, uniqueness:true
end
