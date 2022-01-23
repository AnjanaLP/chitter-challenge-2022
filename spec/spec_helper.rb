ENV['RACK_ENV'] = 'test'

require File.join(File.dirname(__FILE__), '..', 'app/app.rb')
require 'capybara'
require 'capybara/rspec'
require 'rspec'
require 'simplecov'
require 'simplecov-console'
require 'support/database_cleaner'

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new([
  SimpleCov::Formatter::Console,
])
SimpleCov.start

Capybara.app = Chitter
