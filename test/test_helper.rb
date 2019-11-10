ENV['RAILS_ENV'] ||= 'test'

require 'simplecov'
SimpleCov.start :rails unless ENV['NO_COVERAGE']

require_relative '../config/environment'
require 'rails/test_help'
require 'minitest/rails'
require 'minitest/spec'
require 'minitest/reporters'
require 'minitest/reporters/ordered_spec_reporter'
require 'minitest_autoskip'

Minitest::Reporters.use! Minitest::Reporters::OrderedSpecReporter.new

class ActiveSupport::TestCase
  # Run tests in parallel with specified workers
  parallelize(workers: :number_of_processors)

  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...
end

class ActionDispatch::IntegrationTest
  # include devise helpers for all controller and integration tests
  include Devise::Test::IntegrationHelpers

  def json_response
    @json_response ||= ActiveSupport::JSON.decode response.body
  end
end
