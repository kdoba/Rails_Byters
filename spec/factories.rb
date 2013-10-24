require 'factory_girl'

FactoryGirl.define do
  factory :project, class: Project do
    name "First Project"
    description  "Yohoho"
    lifecycle_id 1
  end

  factory :project_phase, class: ProjectPhase do
    lifecycle_phase_id 1
    project_id 1
  end

  factory :project_phase_deliverable, class: ProjectPhaseDeliverable do
    project_phase_id 1
    name "First Deliverable"
    description "yay"
    uom_id 1
    size 1
    rate 1.0
    complexity_id 1
    deliverable_type_id 1
    effort 1
  end


  factory :lifecycle, class: Lifecycle do
    name "Waterfall"
    description "Cool Lifecycle"
  end

  factory :lifecycle_phase, class: LifecyclePhase do
    name "Requirements Specification"
    description "Cool Description"
    sequenceNumber 1
    lifecycle_id 1
  end

  factory :deliverable_type do
    name "MyString"
    lifecycle_phase_id 1
    uom_id 1
  end
end
