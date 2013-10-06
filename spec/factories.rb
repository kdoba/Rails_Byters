require 'factory_girl'

FactoryGirl.define do
  factory :project, class: Project do
    name "First Project"
    description  "Yohoho"
    lifecycle_id 0
  end

  factory :project_phase, class: ProjectPhase do
    lifecycle_phase_id 1
    project_id 1
  end
end