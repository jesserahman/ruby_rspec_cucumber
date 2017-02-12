require 'rubygems'
require 'capybara'
require 'capybara/cucumber'
require 'selenium/webdriver'
require 'pry'
require 'pry-byebug'

Capybara.register_driver :selenium_chrome do |app|
  Capybara::Selenium::Driver.new(app, :browser => :chrome)
end

Capybara.default_driver = :selenium_chrome
Capybara.run_server = false
Capybara.default_max_wait_time = 10


