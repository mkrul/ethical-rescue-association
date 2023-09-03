ENV["RAILS_ENV"] ||= "test"
require_relative "../config/environment"
require "rails/test_help"
require "database_cleaner"
require "rspec/rails"

class ActiveSupport::TestCase
  # Run tests in parallel with specified workers
  parallelize(workers: :number_of_processors)

  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...
end

RSpec.configure do |config|
  DEFAULT_CLEANER_STRATEGY = :transaction

  def with_truncation
    DatabaseCleaner.strategy = :truncation
    yield
  ensure
    DatabaseCleaner.strategy = DEFAULT_CLEANER_STRATEGY
  end

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
end