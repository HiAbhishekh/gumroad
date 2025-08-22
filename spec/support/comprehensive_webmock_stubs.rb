# frozen_string_literal: true

# ComprehensiveWebmockStubs provides complete API mocking for all external services
# This ensures tests never make real HTTP calls to external APIs
module ComprehensiveWebmockStubs
  def self.setup!
    return unless defined?(WebMock)

    # Enable WebMock for all external requests
    WebMock.enable!
    WebMock.disable_net_connect!(allow_localhost: true)

    setup_payment_stubs
    setup_aws_stubs
    setup_email_stubs
    setup_tax_service_stubs
    setup_social_media_stubs
    setup_analytics_stubs
    setup_file_service_stubs
    setup_ai_service_stubs
    setup_misc_service_stubs
  end

  private

  def self.setup_payment_stubs
    # Stripe API stubs
    WebMock.stub_request(:any, %r{https://api\.stripe\.com/.*})
           .to_return(
             status: 200,
             body: { id: "test_charge_123", status: "succeeded" }.to_json,
             headers: { "Content-Type" => "application/json" }
           )

    # PayPal API stubs
    WebMock.stub_request(:any, %r{https://.*\.paypal\.com/.*})
           .to_return(
             status: 200,
             body: { status: "COMPLETED", id: "test_payment_123" }.to_json,
             headers: { "Content-Type" => "application/json" }
           )

    # Braintree API stubs
    WebMock.stub_request(:any, %r{https://.*\.braintreegateway\.com/.*})
           .to_return(
             status: 200,
             body: { transaction: { id: "test_txn_123", status: "submitted_for_settlement" } }.to_json,
             headers: { "Content-Type" => "application/json" }
           )
  end

  def self.setup_aws_stubs
    # S3 API stubs
    WebMock.stub_request(:any, %r{https://.*\.s3\.amazonaws\.com/.*})
           .to_return(status: 200, body: "test-file-content")

    WebMock.stub_request(:any, %r{https://s3\.amazonaws\.com/.*})
           .to_return(status: 200, body: "test-file-content")

    # CloudFront stubs
    WebMock.stub_request(:any, %r{https://.*\.cloudfront\.net/.*})
           .to_return(status: 200, body: "test-cdn-content")

    # Other AWS services
    WebMock.stub_request(:any, %r{https://.*\.amazonaws\.com/.*})
           .to_return(
             status: 200,
             body: { ResponseMetadata: { RequestId: "test-request-id" } }.to_json,
             headers: { "Content-Type" => "application/json" }
           )
  end

  def self.setup_email_stubs
    # SendGrid API stubs
    WebMock.stub_request(:any, %r{https://api\.sendgrid\.com/.*})
           .to_return(
             status: 202,
             body: { message: "success" }.to_json,
             headers: { "Content-Type" => "application/json" }
           )

    # Resend API stubs
    WebMock.stub_request(:any, %r{https://api\.resend\.com/.*})
           .to_return(
             status: 200,
             body: { id: "test-email-123" }.to_json,
             headers: { "Content-Type" => "application/json" }
           )
  end

  def self.setup_tax_service_stubs
    # TaxJar API stubs
    WebMock.stub_request(:any, %r{https://api\.taxjar\.com/.*})
           .to_return(
             status: 200,
             body: { tax: { amount_to_collect: 0.85, rate: 0.085 } }.to_json,
             headers: { "Content-Type" => "application/json" }
           )

    # VATStack API stubs
    WebMock.stub_request(:any, %r{https://api\.vatstack\.com/.*})
           .to_return(
             status: 200,
             body: { valid: true, country_code: "US" }.to_json,
             headers: { "Content-Type" => "application/json" }
           )

    # IRAS API stubs
    WebMock.stub_request(:any, %r{https://.*iras\.gov\.sg/.*})
           .to_return(
             status: 200,
             body: { status: "success" }.to_json,
             headers: { "Content-Type" => "application/json" }
           )

    # Tax ID Pro API stubs
    WebMock.stub_request(:any, %r{https://api\.taxidpro\.com/.*})
           .to_return(
             status: 200,
             body: { valid: true }.to_json,
             headers: { "Content-Type" => "application/json" }
           )
  end

  def self.setup_social_media_stubs
    # Twitter API stubs
    WebMock.stub_request(:any, %r{https://api\.twitter\.com/.*})
           .to_return(
             status: 200,
             body: { data: { id: "test-tweet-123", text: "Test tweet" } }.to_json,
             headers: { "Content-Type" => "application/json" }
           )

    # Discord API stubs
    WebMock.stub_request(:any, %r{https://discord\.com/api/.*})
           .to_return(
             status: 200,
             body: { id: "test-discord-123" }.to_json,
             headers: { "Content-Type" => "application/json" }
           )

    # Facebook API stubs
    WebMock.stub_request(:any, %r{https://graph\.facebook\.com/.*})
           .to_return(
             status: 200,
             body: { id: "test-fb-123" }.to_json,
             headers: { "Content-Type" => "application/json" }
           )
  end

  def self.setup_analytics_stubs
    # Google Analytics stubs
    WebMock.stub_request(:any, %r{https://.*\.googleapis\.com/.*})
           .to_return(
             status: 200,
             body: { kind: "analytics#data" }.to_json,
             headers: { "Content-Type" => "application/json" }
           )
  end

  def self.setup_file_service_stubs
    # Dropbox API stubs
    WebMock.stub_request(:any, %r{https://api\.dropboxapi\.com/.*})
           .to_return(
             status: 200,
             body: { name: "test-file.pdf", size: 1024 }.to_json,
             headers: { "Content-Type" => "application/json" }
           )

    # Unsplash API stubs
    WebMock.stub_request(:any, %r{https://api\.unsplash\.com/.*})
           .to_return(
             status: 200,
             body: { urls: { regular: "https://example.com/test-image.jpg" } }.to_json,
             headers: { "Content-Type" => "application/json" }
           )
  end

  def self.setup_ai_service_stubs
    # OpenAI API stubs
    WebMock.stub_request(:any, %r{https://api\.openai\.com/.*})
           .to_return(
             status: 200,
             body: { 
               choices: [{ message: { content: "Test AI response" } }],
               usage: { total_tokens: 10 }
             }.to_json,
             headers: { "Content-Type" => "application/json" }
           )
  end

  def self.setup_misc_service_stubs
    # EasyPost API stubs
    WebMock.stub_request(:any, %r{https://api\.easypost\.com/.*})
           .to_return(
             status: 200,
             body: { id: "test-shipment-123", status: "delivered" }.to_json,
             headers: { "Content-Type" => "application/json" }
           )

    # Circle API stubs
    WebMock.stub_request(:any, %r{https://api\.circle\.com/.*})
           .to_return(
             status: 200,
             body: { data: { id: "test-transaction-123" } }.to_json,
             headers: { "Content-Type" => "application/json" }
           )

    # Open Exchange Rates API stubs
    WebMock.stub_request(:any, %r{https://openexchangerates\.org/.*})
           .to_return(
             status: 200,
             body: { rates: { EUR: 0.85, GBP: 0.73 } }.to_json,
             headers: { "Content-Type" => "application/json" }
           )

    # Zoom API stubs
    WebMock.stub_request(:any, %r{https://api\.zoom\.us/.*})
           .to_return(
             status: 200,
             body: { id: "test-meeting-123" }.to_json,
             headers: { "Content-Type" => "application/json" }
           )

    # Google Calendar API stubs
    WebMock.stub_request(:any, %r{https://www\.googleapis\.com/calendar/.*})
           .to_return(
             status: 200,
             body: { kind: "calendar#event" }.to_json,
             headers: { "Content-Type" => "application/json" }
           )

    # Bugsnag API stubs (already exists but ensuring it's covered)
    WebMock.stub_request(:post, "https://notify.bugsnag.com/")
           .to_return(status: 200, body: "OK")

    WebMock.stub_request(:post, "https://sessions.bugsnag.com/")
           .to_return(status: 200, body: "OK")

    # Iffy API stubs
    WebMock.stub_request(:post, %r{.*iffy-live\.gumroad\.com/people/buyer_info})
           .to_return(
             status: 200,
             body: { require_zip: false }.to_json,
             headers: { "Content-Type" => "application/json" }
           )

    # Pwned Passwords API stubs
    WebMock.stub_request(:get, %r{api\.pwnedpasswords\.com/range/.+})
           .to_return(status: 200, body: "")
  end
end

# Auto-setup WebMock stubs when this file is required in test environment
if Rails.env.test?
  ComprehensiveWebmockStubs.setup!
end
