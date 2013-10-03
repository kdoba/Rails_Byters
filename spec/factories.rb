require 'factory_girl'

FactoryGirl.define do
  factory :project, class: Project do
    name "First Project"
    description  "Yohoho"
  end
end