source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end
gem 'jquery-cdn'
gem 'notifications', '~> 0.6.0'
gem 'paystack'
gem 'dotenv'
gem 'delayed_job_active_record'
gem 'delayed_job_recurring'
gem 'daemons'
gem 'ckeditor'
gem 'simple_form'
# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.1.4'
# Use sqlite3 as the database for Active Record
group :development, :test do
  gem 'sqlite3'
end

group :production do
  gem 'pg', '~> 0.20'
end
# Use Puma as the app server
gem 'puma', '~> 3.7'
gem 'bootstrap_jt'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
gem 'therubyracer', platforms: :ruby
gem 'rails_12factor', group: :production

# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 3.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'
gem "simple_calendar", "~> 2.0"
gem 'remotipart'
gem 'toastr-rails'
gem 'bcrypt'
gem 'jquery-rails'
gem 'jquery-ui-rails'
gem 'modernizr-rails'
gem 'font-awesome-rails'

gem 'wicked_pdf'
gem 'kaminari'

gem 'wkhtmltopdf-binary-edge', group: [:development]
gem 'wkhtmltopdf-heroku', group: [:production, :staging]

gem 'friendly_id', '~> 5.2', '>= 5.2.3' # Note: You MUST use 5.0.0 or greater for Rails 4.0+

gem 'devise'
gem 'bootstrap-sass' , '~> 3.3.7'

#gem 'cancancan'
#gem 'paperclip'

gem 'carrierwave'
#gem "rolify"
gem 'will_paginate-bootstrap'
#gem "mini_magick"
#gem 'rmagick', '~> 2.15', '>= 2.15.4'
gem 'jquery-turbolinks'
# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development
gem 'font-awesome-sass', '~> 4.7.0'
group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '~> 2.13'
  gem 'selenium-webdriver'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console', '>= 3.3.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
ruby "2.4.3"

