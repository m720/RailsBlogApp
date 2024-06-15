require 'rails/all'
require "simplecov"


# require 'rspec/support/spec'
# require 'rspec/core/sandbox'
# require 'rspec/matchers/fail_matchers'
# require 'rspec/rails'
# require 'ammeter/init'


# See http://rubydoc.info/gems/rspec-core/RSpec/Core/Configuration
RSpec.configure do |config|
  # Bring in the failure matchers from rspec-expectations

  config.expect_with :rspec do |expectations|
    # include_chain_clauses_in_custom_matcher_descriptions is removed in RSpec Expectations 4
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true if expectations.respond_to?(:include_chain_clauses_in_custom_matcher_descriptions=)
    expectations.max_formatted_output_length = 1000
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
    mocks.verify_doubled_constant_names = true
  end

  config.filter_run_when_matching :focus

end