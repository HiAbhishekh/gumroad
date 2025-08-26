# frozen_string_literal: true

# Test environment setup for running tests without production secrets
ENV["RAILS_ENV"] = "test"
ENV["GUMROAD_TEST_MODE"] = "true"

# Database fallbacks
ENV["DATABASE_URL"] ||= "sqlite3:db/test.sqlite3"

# Disable external services that require secrets
ENV["DISABLE_EXTERNAL_APIS"] = "true"

# Active Storage configuration for tests
ENV["ACTIVE_STORAGE_SERVICE"] = "local"

# Disable image processing services
ENV["IMAGEMAGICK_ENABLED"] = "false"

require_relative "../../lib/utilities/test_global_config"
