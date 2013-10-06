#To Populate you database:
# bundle exec rake db:populate
# bundle exec rake test:prepare

namespace :db do
  desc "Fill dtabase with sample data"
  task populate: :environment do

    30.times do |n|

      FactoryGirl.create(:project, name: "Project"+n.to_s,
                         description: "Great projects"+n.to_s,
                         lifecycle_id: n % 4)

      5.times do |m|
        FactoryGirl.create(:project_phase, :lifecycle_phase_id => m, :project_id => n+1)
      end
    end

    FactoryGirl.create(:lifecycle)

    FactoryGirl.create(:lifecycle_phase)
    FactoryGirl.create(:lifecycle_phase, name: "Design", sequenceNumber: 2)
    FactoryGirl.create(:lifecycle_phase, name: "Construction", sequenceNumber: 3)
    FactoryGirl.create(:lifecycle_phase, name: "Integration", sequenceNumber: 4)
    FactoryGirl.create(:lifecycle_phase, name: "Testing", sequenceNumber: 5)
    FactoryGirl.create(:lifecycle_phase, name: "Installation", sequenceNumber: 6)
    FactoryGirl.create(:lifecycle_phase, name: "Maintenance", sequenceNumber: 7)

    FactoryGirl.create(:lifecycle, name: "Simple Waterfall")
    FactoryGirl.create(:lifecycle_phase, name: "Construction", sequenceNumber: 1, lifecycle_id: 2)
    FactoryGirl.create(:lifecycle_phase, name: "Integration", sequenceNumber: 2, lifecycle_id: 2)
    FactoryGirl.create(:lifecycle_phase, name: "Maintainence", sequenceNumber: 3, lifecycle_id: 2)


  end
end