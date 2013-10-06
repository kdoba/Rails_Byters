#To Populate you database:
# bundle exec rake db:populate
# bundle exec rake test:prepare

namespace :db do
  desc "Fill dtabase with sample projects"
  task populate: :environment do

    # try to truncate the db manually so that we have a pristine db
    config = ActiveRecord::Base.configurations[::Rails.env]
    ActiveRecord::Base.establish_connection
    case config["adapter"]
      when "mysql", "postgresql"
        ActiveRecord::Base.connection.tables.each do |table|
          ActiveRecord::Base.connection.execute("TRUNCATE #{table}")
        end
      when "sqlite", "sqlite3"
        ActiveRecord::Base.connection.tables.each do |table|
          ActiveRecord::Base.connection.execute("DELETE FROM #{table}")
          ActiveRecord::Base.connection.execute("DELETE FROM sqlite_sequence where name='#{table}'")
        end
        ActiveRecord::Base.connection.execute("VACUUM")
    end

    30.times do |n|

      FactoryGirl.create(:project, name: "Project"+n.to_s,
                         description: "Great projects"+n.to_s,
                         lifecycle_id: n % 4)

      5.times do |m|
        FactoryGirl.create(:project_phase, :lifecycle_phase_id => m, :project_id => n+1)
      end

    end
  end
end