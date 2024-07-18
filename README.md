# README

(Project Work In ProgresS)

CatBreed

An application intended for cat breeders. Description of cats, possibility of booking, blog, contact form.

# Link to the working version of the project.
https://catbreed-dry-frog-7835.fly.dev

Technologies and tools used:

- **Frontend:**
  - [Tailwind CSS](https://tailwindcss.com/)
- **Backend:**
  - [Ruby on Rails 7.0.8](https://rubyonrails.org/)
- **Database:**
  - [PostgreSQL](https://www.postgresql.org/)
- **Others:**
  - [RSpec](https://rspec.info/) - testing
  - [Docker](https://www.docker.com/) - containerization
  - [Devise](https://github.com/heartcombo/devise) - authentication
  - [Cancancan] (https://github.com/CanCanCommunity/cancancan) - authorization
  - [Ransack](https://github.com/activerecord-hackery/ransack) - search and filtering
  - [FactoryBot](https://github.com/thoughtbot/factory_bot) - test data creation
  - [Faker](https://github.com/faker-ruby/faker) - test data generation
  - [Shrine](https://shrinerb.com/) - file uploads
  - [Letter Opener](https://github.com/ryanb/letter_opener) - email preview
  - [Puma](https://puma.io/) - application server
  - [Turbo](https://github.com/hotwired/turbo-rails) - live updates
  - [Stimulus](https://stimulus.hotwired.dev/) - JavaScript framework for interactions
  - [Importmap-rails](https://github.com/rails/importmap-rails) - managing JavaScript dependencies without Webpack
  - [ViewComponent](https://github.com/github/view_component) - view components
  - [Database Cleaner](https://github.com/DatabaseCleaner/database_cleaner) - maintaining clean database in tests
  - [dotenv-rails](https://github.com/bkeepers/dotenv) - environment variable management


## Installation

Step-by-step instructions on how to run your project locally.

```bash
# Cloning the repository
git clone https://github.com/bartlomiejpogorzelski/CatBreed.git

# Change to the project directory
cd CatBreed

# Installing dependencies (example for a Rails project)
bundle install

# Creation and migration of the database
rails db:create
rails db:migrate
rails db:seed

# Start the server
rails s

# Start tailwindcss
rails bin tailwindcss:watch
