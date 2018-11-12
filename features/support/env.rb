require 'capybara/cucumber'
require 'selenium/webdriver'
require 'rspec/expectations'
require_relative '../../page_objects/require_all_page_objects'

Capybara.default_driver = :selenium_chrome
Capybara.default_selector = :css
Capybara.default_max_wait_time = 5

World(RSpec::Matchers)