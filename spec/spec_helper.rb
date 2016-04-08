require 'capybara/rspec'
require 'capybara/poltergeist'

RSpec.configure do |config|
  Capybara.javascript_driver = :poltergeist
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.filter_run :focus
  config.run_all_when_everything_filtered = true

  # VCR cannot record phantomjs requests, so do not ever set this
  # to run during any kind of automated build system. Use sparingly
  # while developing as needed. To run pass live_test as a tag to
  # rspec e.g. `rspec --tag live_test`
  config.filter_run_excluding :live_test

  config.example_status_persistence_file_path = "spec/examples.txt"

  config.profile_examples = 10
  config.order = :random
  Kernel.srand config.seed
end
