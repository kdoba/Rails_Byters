#To Populate you database:
# bundle exec rake db:populate
# bundle exec rake test:prepare

namespace :db do
  desc "Fill database with sample data"

  # call this if you already have a populated database and want to repopulate
  task :repopulate => [:environment, 'db:reset', 'db:populate']

  task populate: :environment do


    json = File.read('deliverable_types_data_complete.json')
    parsedData = JSON.parse(json)


    deliverableTypesData = Hash.new
    parsedData.each do |dataEntry|
      if !deliverableTypesData.has_key?(dataEntry[0])
        deliverableTypesData[dataEntry[0]] = Hash.new()
      end

      lifecycleHash = deliverableTypesData[dataEntry[0]]
      if !lifecycleHash.has_key?(dataEntry[1])
        lifecycleHash[dataEntry[1]] = []
      end

      phaseArray = lifecycleHash[dataEntry[1]]
      phaseArray.append([dataEntry[2], dataEntry[3]])

    end

    deliverableTypesData.each_pair do |lifecycle, lifecyclePhaseHash|
      # create a new lifecycle entry
      newLifecycle = FactoryGirl.create(:lifecycle, name: lifecycle)

      # create lifecycle phases for the new lifecycle
      lifecyclePhaseHash.each_with_index do |(lifecyclePhase,deliverableTypeArray),index|
        newLifecyclePhase = FactoryGirl.create(:lifecycle_phase, name: lifecyclePhase, sequenceNumber: index, lifecycle_id:newLifecycle.id)

        deliverableTypeArray.each do |propertyArray|
          FactoryGirl.create(:deliverable_type, name: propertyArray[0], lifecycle_phase_id:newLifecyclePhase.id)
        end
      end
    end

    @lifecycleCount = Lifecycle.count
    if Rails.env.development?
      10.times do |n|

        @project = FactoryGirl.create(:project, name: "Project"+n.to_s,
                                      description: "Great projects"+n.to_s,
                                      lifecycle_id: n % @lifecycleCount + 1)

        @project_phases = ProjectPhase.find_all_by_project_id(@project.id)
        @project_phases.each do |project_phase|
          #create some dummy deliverables for each project phase
          2.times do |index|
            FactoryGirl.create(:project_phase_deliverable,
                               name: "Deliverable " + (index + 1).to_s,
                               project_phase_id: project_phase.id)
          end
        end

      end
    end


  end
end