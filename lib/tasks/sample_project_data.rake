#To Populate you database:
# bundle exec rake db:populate
# bundle exec rake test:prepare

namespace :db do
  desc "Fill dtabase with sample projects"
  task populate: :environment do
    30.times do |n|
      Project.create!(name: "Project"+n.to_s,
                      description: "Great projects"+n.to_s,
                      lifecycle_id: n % 4)
    end
  end
end