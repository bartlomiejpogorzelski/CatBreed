source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.2.2"
gem "rails", "~> 7.0.7"
gem "pg", "~> 1.5"
# Use Puma as the app server
gem 'puma', '~> 5.0'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.7'
gem 'sprockets-rails'
gem 'tailwindcss-rails'
gem 'haml'
gem 'view_component'
gem 'rails-i18n'
gem 'faker'
gem "devise", github: "heartcombo/devise", branch: "main"
gem 'cancancan'
gem 'shrine'
gem "image_processing", "~> 1.0"
gem 'mailtrap'
gem 'ransack', github: 'activerecord-hackery/ransack'
gem 'aws-sdk-s3'
gem 'importmap-rails'
gem 'turbo-rails'
gem "stimulus-rails"

group :development do
  gem "web-console"
  gem "listen"
  gem 'dotenv-rails', groups: [:development, :test]
end

group :development, :test do
  gem "database_cleaner"
  gem "rspec-rails"
  gem "pg_query"
  gem "pry", " ~> 0.14.1"
  gem 'letter_opener'
  gem 'factory_bot_rails'
end

group :test do
  # gem 'factory_bot_rails', '~> 6.2'
  gem "test-prof", "~> 1.2"
  gem 'rails-controller-testing'
end

gem "dockerfile-rails", ">= 1.6", :group => :development
