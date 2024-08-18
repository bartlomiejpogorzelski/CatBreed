# spec/support/capybara.rb

require 'capybara/rspec'
require 'webdrivers'

Capybara.register_driver :selenium_chrome do |app|
  options = Selenium::WebDriver::Chrome::Options.new
  options.add_argument('--headless') unless ENV['NO_HEADLESS'] #define that chrome is open or not
  options.add_argument('--disable-gpu')
  options.add_argument('--no-sandbox')
  options.add_argument('--disable-dev-shm-usage')
  # options.add_argument('--disable-popup-blocking') # Ukrywa
  options.add_argument('--user-data-dir=/tmp/chrome-profile') # Hide welcome popup in chrome

  Capybara::Selenium::Driver.new(app,
    browser: :chrome,
    options: options
  )
end

Capybara.default_driver = :selenium_chrome
Capybara.javascript_driver = :selenium_chrome
