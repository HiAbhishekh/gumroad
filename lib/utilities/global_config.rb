# frozen_string_literal: true

require_relative "test_global_config"

# GlobalConfig provides a centralized way to access environment variables and Rails credentials
# Enhanced to support test mode with safe defaults
class GlobalConfig
  class << self
    # Retrieve a value by its name from environment variables or Rails credentials
    # @param name [String] The name of the environment variable
    # @param default [Object] The default value to return if the value is not found in ENV or credentials
    # @return [String, Object, nil] The value from environment variable, credentials, the default value, or nil if not found and no default provided
    def get(name, default = :__no_default_provided__)
      # In test mode, return test defaults first to avoid secret dependencies
      if TestGlobalConfig.test_mode?
        test_value = TestGlobalConfig.get_test_default(name)
        return test_value if test_value
      end

      if default == :__no_default_provided__
        value = ENV.fetch(name, fetch_from_credentials_safe(name))
        value.presence
      else
        ENV.fetch(name, fetch_from_credentials_safe(name) || default)
      end
    end

    # Retrieve a nested value by joining the parts with double underscores
    # @param parts [Array<String>] The parts to join for the environment variable name
    # @param default [Object] The default value to return if the value is not found
    # @return [String, Object, nil] The value from environment variable, credentials, the default value, or nil if not found and no default provided
    def dig(*parts, default: :__no_default_provided__)
      name = parts.map(&:upcase).join("__")
      if default == :__no_default_provided__
        get(name)
      else
        get(name, default)
      end
    end

    private
      # Safely fetch a value from Rails credentials by converting the environment variable name to credential keys
      # @param name [String] The name of the environment variable
      # @return [Object, nil] The value from credentials or nil if not found or fails
      def fetch_from_credentials_safe(name)
        return nil if TestGlobalConfig.test_mode?
        
        keys = name.downcase.split("__").map(&:to_sym)
        Rails.application.credentials.dig(*keys)
      rescue StandardError => e
        # In test mode, log the error but don't fail
        if TestGlobalConfig.test_mode?
          Rails.logger&.debug "Failed to fetch credential #{name}: #{e.message}"
          return nil
        end
        raise e
      end
  end
end
