class LifecyclePhase < ActiveRecord::Base
  attr_accessible :description, :name, :sequenceNumber
  validates :name, presence:true
  validates :sequenceNumber, presence:true
  belongs_to :lifecycle
end
