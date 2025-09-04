# frozen_string_literal: true
module Mysql2
  class Client
    def initialize(*args)
    end
    
    def query(sql)
      []
    end
    
    def close
    end
  end
  
  class Result
    def initialize
      @rows = []
      @fields = []
    end
    
    def each
      @rows.each { |row| yield row }
    end
    
    def count
      @rows.length
    end
  end
  
  class Error < StandardError
  end
end

class Alterity
  def self.configure
  end

  def self.start
  end

  def self.stop
  end
end

module SidekiqPro
  class << self
    def configure
    end
  end
end

# Mock Sidekiq worker functionality
module Sidekiq
  module Worker
    def self.included(base)
      base.extend(ClassMethods)
    end

    module ClassMethods
      def sidekiq_options(options = {})
        # Mock sidekiq_options method - just return the options
        options
      end
    end
  end

  module Job
    def self.included(base)
      base.extend(ClassMethods)
    end

    module ClassMethods
      def sidekiq_options(options = {})
        # Mock sidekiq_options method - just return the options
        options
      end
    end
  end
end

# Add sidekiq_options as a class method to all classes that might need it
# This needs to be done after Sidekiq loads to override its methods
class Class
  def sidekiq_options(options = {})
    # Mock sidekiq_options method - just return the options
    options
  end

  def sidekiq_retries_exhausted(&block)
    # Mock sidekiq_retries_exhausted method - just return the block
    block
  end
end

# Also add it to Module class to catch any module-level calls
class Module
  def sidekiq_options(options = {})
    # Mock sidekiq_options method - just return the options
    options
  end

  def sidekiq_retries_exhausted(&block)
    # Mock sidekiq_retries_exhausted method - just return the block
    block
  end
end

module Mongoid
  class << self
    def purge!
    end
  end
end

module GlobalConfigOverride
  def self.included(base)
    base.class_eval do
      def self.get(name, default = :__no_default_provided__)
        test_values = {
          "STRIPE_API_KEY" => "sk_test_1234567890abcdef",
          "STRIPE_PLATFORM_ACCOUNT_ID" => "acct_test123456",
          "STRIPE_CONNECT_CLIENT_ID" => "ca_test123456",
          "PAYPAL_USERNAME" => "test_user",
          "PAYPAL_PASSWORD" => "test_password", 
          "PAYPAL_SIGNATURE" => "test_signature",
          "PAYPAL_CLIENT_ID" => "test_client_id",
          "PAYPAL_CLIENT_SECRET" => "test_client_secret",
          "BRAINTREE_API_PRIVATE_KEY" => "test_private_key",
          "BRAINTREE_MERCHANT_ID" => "test_merchant_id",
          "BRAINTREE_PUBLIC_KEY" => "test_public_key",
          "AWS_ACCOUNT_ID" => "123456789012",
          "AWS_ACCESS_KEY_ID" => "AKIAIOSFODNN7EXAMPLE",
          "AWS_SECRET_ACCESS_KEY" => "wJalrXUtnFEMI/K7MDENG/bPxRfiCYEXAMPLEKEY",
          "SENDGRID_GUMROAD_TRANSACTIONS_API_KEY" => "SG.test123456",
          "SENDGRID_GR_CREATORS_API_KEY" => "SG.test123456",
          "SENDGRID_GR_CUSTOMERS_LEVEL_2_API_KEY" => "SG.test123456",
          "SENDGRID_GUMROAD_FOLLOWER_CONFIRMATION_API_KEY" => "SG.test123456",
          "DROPBOX_API_KEY" => "test_dropbox_key",
          "EASYPOST_API_KEY" => "test_easypost_key",
          "VATSTACK_API_KEY" => "test_vatstack_key",
          "IRAS_API_ID" => "test_iras_id",
          "IRAS_API_SECRET" => "test_iras_secret",
          "TAXJAR_API_KEY" => "test_taxjar_key",
          "TAX_ID_PRO_API_KEY" => "test_taxidpro_key",
          "CIRCLE_API_KEY" => "test_circle_key",
          "OPEN_EXCHANGE_RATES_APP_ID" => "test_openexchangerates_id",
          "UNSPLASH_CLIENT_ID" => "test_unsplash_id",
          "DISCORD_BOT_TOKEN" => "test_discord_token",
          "DISCORD_CLIENT_ID" => "test_discord_client_id",
          "ZOOM_CLIENT_ID" => "test_zoom_client_id",
          "GCAL_CLIENT_ID" => "test_gcal_client_id",
          "OPENAI_ACCESS_TOKEN" => "test_openai_token",
          "IOS_CONSUMER_APP_APPLE_LOGIN_IDENTIFIER" => "test_ios_consumer_id",
          "IOS_CREATOR_APP_APPLE_LOGIN_TEAM_ID" => "test_ios_creator_team_id",
          "IOS_CREATOR_APP_APPLE_LOGIN_IDENTIFIER" => "test_ios_creator_id",
          "GOOGLE_CLIENT_ID" => "test_google_client_id",
          "RPUSH_CONSUMER_FCM_FIREBASE_PROJECT_ID" => "test_firebase_project_id",
          "SLACK_WEBHOOK_URL" => "https://hooks.slack.com/test",
          "CLOUDFRONT_KEYPAIR_ID" => "test_cloudfront_keypair_id"
        }
        
        if test_values.key?(name)
          test_values[name]
        elsif default == :__no_default_provided__
          ENV.fetch(name, nil)
        else
          ENV.fetch(name, default)
        end
      end
    end
  end
end

require "active_support/core_ext/object/blank"

class GlobalConfig
  def self.get(key)
    test_values = {
      "STRIPE_API_KEY" => "sk_test_1234567890abcdef",
      "PAYPAL_USERNAME" => "test_user",
      "AWS_ACCESS_KEY_ID" => "AKIAIOSFODNN7EXAMPLE",
      "SENDGRID_API_KEY" => "SG.test1234567890abcdef",
      "DATABASE_URL" => "sqlite3::memory:"
    }
    test_values[key] || "test_#{key.to_s.downcase}"
  end
end

puts "Test environment configured to run without secrets"
puts "All external API keys are mocked with test values"
puts "Tests should now run without external dependencies"
