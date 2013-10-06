class ProjectPhase < ActiveRecord::Base
  belongs_to :project
  attr_accessible :lifecycle_phase_id, :project_id

  validates :lifecycle_phase_id, :project_id, presence: true

  def name
    @lifecycle_phase_names = ["Requirements", "Design", "Implementation", "Verification", "Maintenance"]

    @lifecycle_phase_names[lifecycle_phase_id]
  end
end
