# frozen_string_literal: true

# TestGlobalConfig provides test-safe defaults for all environment variables and secrets
# This allows tests to run without requiring production secrets
module TestGlobalConfig
  # Test defaults for all secrets and environment variables
  TEST_DEFAULTS = {
    # Database Configuration
    "DATABASE_HOST" => "127.0.0.1",
    "DATABASE_NAME" => "gumroad_test",
    "TEST_DATABASE_NAME" => "gumroad_test",
    "DATABASE_PORT" => "3306",
    "DATABASE_USERNAME" => "root",
    "DATABASE_PASSWORD" => "password",
    "MONGO_DATABASE_URL" => "localhost:27017",
    "MONGO_DATABASE_NAME" => "gumroad_log_test",
    "MONGO_DATABASE_USERNAME" => "",
    "MONGO_DATABASE_PASSWORD" => "",

    # Redis Configuration
    "REDIS_HOST" => "localhost:6379/10",
    "SIDEKIQ_REDIS_HOST" => "localhost:6379/11",
    "RPUSH_REDIS_HOST" => "localhost:6379/12",
    "RACK_ATTACK_REDIS_HOST" => "localhost:6379/13",

    # AWS/S3 Configuration
    "AWS_ACCESS_KEY_ID" => "test-aws-access-key",
    "AWS_SECRET_ACCESS_KEY" => "test-aws-secret-key",
    "AWS_DEFAULT_REGION" => "us-east-1",
    "AWS_ACCOUNT_ID" => "123456789012",
    "S3_DELETER_ACCESS_KEY_ID" => "test-s3-deleter-key",
    "S3_DELETER_SECRET_ACCESS_KEY" => "test-s3-deleter-secret",
    "INVOICES_S3_BUCKET" => "test-invoices-bucket",
    "CLOUDFRONT_KEYPAIR_ID" => "test-cloudfront-keypair",
    "CLOUDFRONT_PRIVATE_KEY" => "-----BEGIN PRIVATE KEY-----\nMIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQC8Vq1wFTerl\n-----END PRIVATE KEY-----",

    # Payment Processor Configuration
    "STRIPE_API_KEY" => "sk_test_123456789",
    "STRIPE_PLATFORM_ACCOUNT_ID" => "acct_test123",
    "STRIPE_CONNECT_CLIENT_ID" => "ca_test123",
    "PAYPAL_USERNAME" => "test@paypal.com",
    "PAYPAL_PASSWORD" => "test-password",
    "PAYPAL_SIGNATURE" => "test-signature",
    "PAYPAL_CLIENT_ID" => "test-paypal-client-id",
    "PAYPAL_CLIENT_SECRET" => "test-paypal-client-secret",
    "PAYPAL_MERCHANT_EMAIL" => "test@merchant.com",
    "PAYPAL_PARTNER_CLIENT_ID" => "test-partner-client-id",
    "PAYPAL_PARTNER_MERCHANT_ID" => "test-partner-merchant-id",
    "PAYPAL_PARTNER_MERCHANT_EMAIL" => "test@partner.com",
    "PAYPAL_BN_CODE" => "test-bn-code",
    "BRAINTREE_API_PRIVATE_KEY" => "test-braintree-key",
    "BRAINTREE_MERCHANT_ID" => "test-merchant-id",
    "BRAINTREE_PUBLIC_KEY" => "test-public-key",
    "BRAINTREE_MERCHANT_ACCOUNT_ID_FOR_SUPPLIERS" => "test-supplier-account",

    # Email Service Configuration
    "SENDGRID_GUMROAD_TRANSACTIONS_API_KEY" => "SG.test-transactions-key",
    "SENDGRID_GR_CREATORS_API_KEY" => "SG.test-creators-key",
    "SENDGRID_GR_CUSTOMERS_LEVEL_2_API_KEY" => "SG.test-customers-key",
    "SENDGRID_GUMROAD_FOLLOWER_CONFIRMATION_API_KEY" => "SG.test-follower-key",

    # Third-Party API Keys
    "DROPBOX_API_KEY" => "test-dropbox-key",
    "EASYPOST_API_KEY" => "EZTKTEST_123",
    "VATSTACK_API_KEY" => "test-vatstack-key",
    "TAXJAR_API_KEY" => "test-taxjar-key",
    "TAX_ID_PRO_API_KEY" => "test-tax-id-pro-key",
    "CIRCLE_API_KEY" => "test-circle-key",
    "OPEN_EXCHANGE_RATES_APP_ID" => "test-exchange-rates-id",
    "UNSPLASH_CLIENT_ID" => "test-unsplash-client-id",
    "DISCORD_BOT_TOKEN" => "test-discord-bot-token",
    "DISCORD_CLIENT_ID" => "test-discord-client-id",
    "ZOOM_CLIENT_ID" => "test-zoom-client-id",
    "GCAL_CLIENT_ID" => "test-gcal-client-id",
    "OPENAI_ACCESS_TOKEN" => "test-openai-token",

    # Tax Services
    "IRAS_API_ID" => "test-iras-id",
    "IRAS_API_SECRET" => "test-iras-secret",

    # Security and Encryption
    "STRONGBOX_GENERAL_PASSWORD" => "test-password-123",
    "DEVISE_SECRET_KEY" => "test-devise-secret-key-" + "a" * 64,
    "SECURE_ENCRYPT_KEY" => "test-secure-encrypt-key-32bytes!",
    "OBFUSCATE_IDS_CIPHER_KEY" => "test-obfuscate-cipher-key-32bytes",
    "OBFUSCATE_IDS_NUMERIC_CIPHER_KEY" => "123456789",
    "MAILER_HEADERS_ENCRYPTION_KEY_V1" => "test-mailer-encryption-key-32bytes",

    # Search and Analytics
    "ELASTICSEARCH_HOST" => "http://localhost:9200",

    # File Processing
    "IFFY_WEBHOOK_SECRET" => "test-iffy-webhook-secret"
  }.freeze

  def self.test_mode?
    ENV["RAILS_ENV"] == "test" || ENV["GUMROAD_TEST_MODE"] == "true"
  end

  def self.get_test_default(name)
    return nil unless test_mode?
    TEST_DEFAULTS[name]
  end

  def self.generate_test_rsa_key
    <<~RSA_KEY
      -----BEGIN PRIVATE KEY-----
      MIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQC8Vq1wFTerl1qQ2nKR1pnjyBVPq1COo16HRtlh7llzWNOPNn3ydKj8qtF+YfTOSdH+a5z6x4GvHcmXAjCuwpKKwXFqIqQez/Yyk7cWQ9Lax86TC6nu0MU4+pDCbXa3co2DsLE/ivVbti+0xhEPODIOe2ZKmtRE700QyaBDHcKE2Vo7WgNvM8M5MXNBHVK3sgqELednigXl4/C20kd0j2xKePPK5+1pJOyT/ObVrjOnYJ9J3QvqhaZZfz/eXd9yOf8pxKNl36GvqR04M7T0iNr+rHnNS09YTVbtB+ZkVjM16Uy/TG67IYKEqkRQmwtkRqoaKFuNYA8rC4kSgNCvvCnAgMBAAECggEAK3YqLfCfCqDQ8YQCR9Oo
      -----END PRIVATE KEY-----
    RSA_KEY
  end
end
