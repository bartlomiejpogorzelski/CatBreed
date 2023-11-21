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

group :development do
  gem "web-console"
  gem "listen"
end

group :development, :test do
  gem "database_cleaner"
  gem "rspec-rails"
  gem "pg_query"
  gem "pry", " ~> 0.14.1"
  gem 'letter_opener'
end

group :test do
  gem 'factory_bot_rails'
  gem "test-prof", "~> 1.2"
end
