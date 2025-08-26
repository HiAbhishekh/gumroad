# frozen_string_literal: true

# Test environment setup for running tests without production secrets
# This approach sets environment variables directly, avoiding production code modifications

ENV["RAILS_ENV"] = "test"
ENV["GUMROAD_TEST_MODE"] = "true"

require_relative "../../lib/utilities/test_global_config"

# Set all test defaults as environment variables
# This ensures tests run without touching production GlobalConfig
TestGlobalConfig::TEST_DEFAULTS.each do |key, value|
  ENV[key] ||= value
end

# Additional test-specific overrides
ENV["DATABASE_URL"] ||= "sqlite3:db/test.sqlite3"
ENV["DISABLE_EXTERNAL_APIS"] = "true"
