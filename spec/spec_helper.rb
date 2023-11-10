ENV["RAILS_ENV"] ||= "test"
require_relative 'support/controller_macros'
require_relative "../config/environment"
require "rails/test_help"
require "database_cleaner"
require "rspec/rails"
require "capybara/rspec"
require "capybara/rails"
require "devise"

class ActiveSupport::TestCase
  # Run tests in parallel with specified workers
  parallelize(workers: :number_of_processors)

  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...
end

RSpec.configure do |config|
  config.include Devise::Test::ControllerHelpers, type: :controller
  config.extend ControllerMacros, type: :controller
  # config.include Devise::Test::ControllerHelpers, type: :view
  # config.include Devise::TestHelpers, type: :controller
  # config.include Devise::Test::ControllerHelpers, type: :routing
  # config.include Devise::TestHelpers, type: :routing
  config.use_transactional_fixtures = false
  config.infer_spec_type_from_file_location!

  DEFAULT_CLEANER_STRATEGY = :truncation

  config.include ActiveSupport::Testing::TimeHelpers

  config.before :suite do
    ActiveJob::Base.queue_adapter = :test
    DatabaseCleaner.strategy = DEFAULT_CLEANER_STRATEGY
    unless ENV["SEED"] == "false"
      DatabaseCleaner.clean_with(:truncation, except: %w(ar_internal_metadata schema_migrations))
    end
    Rails.application.load_tasks
  end

  config.before { ActionMailer::Base.deliveries.clear }

  #clean db before each test is run
  config.before(:each) do
    DatabaseCleaner.strategy = DEFAULT_CLEANER_STRATEGY
    DatabaseCleaner.clean_with(:truncation, except: %w(ar_internal_metadata schema_migrations))
  end
end