source 'https://rubygems.org'

ruby '1.9.3'

gem 'rails', '3.2.14'
gem 'faker', '1.1.2'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

group :test do
  gem 'capybara', '2.1.0'
  gem "simplecov", "0.7.1"
  gem 'shoulda-matchers'
  gem 'selenium-webdriver'
end

group :development, :test do
   gem 'sqlite3'
end

group :production do
  gem 'pg'
  gem 'rails_12factor', '0.0.2'
end



# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  # gem 'therubyracer', :platforms => :ruby

  gem 'uglifier', '>= 1.0.3'
end

gem 'jquery-rails'

#CSS framework
gem 'zurb-foundation'

gem 'json', '1.8.1'

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Use unicorn as the app server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'debugger'

#suggested gems by Todd
gem 'factory_girl_rails'
gem 'rspec-rails'
gem 'devise'
group :development do
#  gem 'ruby-debug-base19x'
#  gem 'ruby-debug-ide'
end
