#To Populate you database:
# bundle exec rake db:populate
# bundle exec rake test:prepare

namespace :db do
  desc "Fill database with sample data"

  # call this if you already have a populated database and want to repopulate
  task :repopulate => [:environment, 'db:reset', 'db:populate']

  task populate: :environment do

    #populate the pre-defined lifecycles and lifecycle phases

    lifecycleData = {       "Waterfall" => ["Requirement Specification", "Design", "Construction", "Integration",
                                             "Testing", "Installation", "Maintenance"],
                             "Spiral" => ["Objective Planning", "Analyze Risks", "Engineering", "Iteration Planning"],
                             "Iterative" => ["Inception", "Elaboration", "Construction", "Transition"],
                             "Agile" => ["Exploration", "Planning", "Iterations to Release", "Deployment", "Maintenance"],
                             "Rapid" => ["Requirements", "Design", "Construction", "Cutover"]
                    }
    lifecycleData.each_pair { |lifecycle, lifecyclePhaseArray|

      # create a new lifecycle entry
      newLifecycle = FactoryGirl.create(:lifecycle, name: lifecycle)

      # create lifecycle phases for the new lifecycle
      lifecyclePhaseArray.each_with_index { |phase, index|
        FactoryGirl.create(:lifecycle_phase, name: phase, sequenceNumber: index, lifecycle_id:newLifecycle.id)
      }
    }

    @lifecycleCount = Lifecycle.count
    if Rails.env.development?
      10.times do |n|

        FactoryGirl.create(:project, name: "Project"+n.to_s,
                           description: "Great projects"+n.to_s,
                           lifecycle_id: n % @lifecycleCount + 1)
      end
    end

  end
end