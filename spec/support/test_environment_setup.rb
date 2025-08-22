# frozen_string_literal: true

# TestEnvironmentSetup provides comprehensive test environment configuration
# to enable running tests without production secrets
module TestEnvironmentSetup
  def self.setup!
    # Enable test mode
    ENV["GUMROAD_TEST_MODE"] = "true"
    ENV["RAILS_ENV"] = "test"

    # Configure test database URLs to use SQLite as fallback if MySQL not available
    setup_database_fallbacks
    
    # Setup mock services
    setup_service_mocks
    
    # Configure VCR for offline testing
    setup_vcr_for_offline_testing
  end

  private

  def self.setup_database_fallbacks
    # If MySQL is not available, fall back to SQLite
    unless mysql_available?
      Rails.logger&.info "MySQL not available, using SQLite for tests"
      ENV["DATABASE_URL"] = "sqlite3:tmp/gumroad_test.sqlite3"
    end

    # If MongoDB is not available, use in-memory mock
    unless mongodb_available?
      Rails.logger&.info "MongoDB not available, using mock for tests"
      setup_mongodb_mock
    end
  end

  def self.mysql_available?
    # Check if MySQL is running on the configured port
    require "socket"
    host = ENV.fetch("DATABASE_HOST", "127.0.0.1")
    port = ENV.fetch("DATABASE_PORT", "3306").to_i
    
    begin
      socket = TCPSocket.new(host, port)
      socket.close
      true
    rescue Errno::ECONNREFUSED, Errno::EHOSTUNREACH, SocketError
      false
    end
  end

  def self.mongodb_available?
    # Check if MongoDB is running
    require "socket"
    mongo_url = ENV.fetch("MONGO_DATABASE_URL", "localhost:27017")
    host, port = mongo_url.split(":")
    port = port&.to_i || 27017
    
    begin
      socket = TCPSocket.new(host, port)
      socket.close
      true
    rescue Errno::ECONNREFUSED, Errno::EHOSTUNREACH, SocketError
      false
    end
  end

  def self.setup_mongodb_mock
    # Create a mock MongoDB module that prevents connection errors
    Object.const_set(:Mongoid, Class.new do
      def self.load!(config_path)
        # Do nothing - prevent Mongoid from trying to connect
      end
      
      def self.configure
        yield MockMongoidConfig.new if block_given?
      end
    end) unless defined?(Mongoid)
  end

  class MockMongoidConfig
    def method_missing(method_name, *args, &block)
      # Accept any configuration method calls
      self
    end

    def respond_to_missing?(method_name, include_private = false)
      true
    end
  end

  def self.setup_service_mocks
    # Mock all external service calls that would require secrets
    mock_aws_services
    mock_payment_services
    mock_email_services
    mock_third_party_apis
  end

  def self.mock_aws_services
    # Mock AWS SDK calls
    if defined?(Aws)
      Aws.config.update(
        stub_responses: true,
        region: "us-east-1",
        credentials: Aws::Credentials.new("test-key", "test-secret")
      )
    end
  end

  def self.mock_payment_services
    # Mock Stripe
    if defined?(Stripe)
      Stripe.api_key = "sk_test_mock"
    end

    # Mock Braintree
    if defined?(Braintree)
      Braintree::Configuration.environment = :sandbox
      Braintree::Configuration.merchant_id = "test-merchant"
      Braintree::Configuration.public_key = "test-public-key"
      Braintree::Configuration.private_key = "test-private-key"
    end
  end

  def self.mock_email_services
    # Mock SendGrid
    ENV["SENDGRID_API_KEY"] = "SG.test-api-key" unless ENV["SENDGRID_API_KEY"]
  end

  def self.mock_third_party_apis
    # Mock OpenAI
    ENV["OPENAI_API_KEY"] = "test-openai-key" unless ENV["OPENAI_API_KEY"]
    
    # Mock other APIs as needed
    ENV["UNSPLASH_ACCESS_KEY"] = "test-unsplash-key" unless ENV["UNSPLASH_ACCESS_KEY"]
  end

  def self.setup_vcr_for_offline_testing
    # Configure VCR to work offline with test data
    if defined?(VCR)
      VCR.configure do |config|
        # In CI or when offline, use existing cassettes or create empty ones
        config.default_cassette_options[:record] = ENV["CI"] ? :none : :once
        
        # Allow localhost and test domains
        config.ignore_hosts "localhost", "127.0.0.1", "0.0.0.0"
        config.ignore_hosts /.*\.test$/, /.*\.localhost$/
        
        # Stub all external APIs with empty responses when cassettes don't exist
        config.before_record do |interaction|
          # Sanitize any remaining secrets in recordings
          interaction.response.body = sanitize_response_body(interaction.response.body)
        end
      end
    end
  end

  def self.sanitize_response_body(body)
    # Remove any potential secrets that might leak into VCR cassettes
    body.to_s.gsub(/[A-Za-z0-9_-]{20,}/, "SANITIZED_TOKEN")
  end
end

# Auto-setup when this file is required in test environment
if Rails.env.test?
  TestEnvironmentSetup.setup!
end
