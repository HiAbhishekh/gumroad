# frozen_string_literal: true

require "webmock/rspec"

# Comprehensive WebMock stubs for all external APIs
module ComprehensiveWebMockStubs
  def self.setup_all_stubs
    # Stripe API stubs
    WebMock.stub_request(:any, /api\.stripe\.com/).to_return(
      status: 200,
      body: { id: "test_stripe_object", object: "charge", amount: 1000 }.to_json,
      headers: { "Content-Type" => "application/json" }
    )

    # PayPal API stubs
    WebMock.stub_request(:any, /api\.paypal\.com/).to_return(
      status: 200,
      body: { id: "test_paypal_payment", state: "approved" }.to_json,
      headers: { "Content-Type" => "application/json" }
    )

    # AWS S3 stubs
    WebMock.stub_request(:any, /s3\.amazonaws\.com/).to_return(
      status: 200,
      body: "<xml>success</xml>",
      headers: { "Content-Type" => "application/xml" }
    )

    # SendGrid API stubs
    WebMock.stub_request(:any, /api\.sendgrid\.com/).to_return(
      status: 202,
      body: { message: "success" }.to_json,
      headers: { "Content-Type" => "application/json" }
    )

    # TaxJar API stubs
    WebMock.stub_request(:any, /api\.taxjar\.com/).to_return(
      status: 200,
      body: { tax: { amount_to_collect: 0 } }.to_json,
      headers: { "Content-Type" => "application/json" }
    )

    # Dropbox API stubs
    WebMock.stub_request(:any, /api\.dropboxapi\.com/).to_return(
      status: 200,
      body: { entries: [] }.to_json,
      headers: { "Content-Type" => "application/json" }
    )

    # OpenAI API stubs
    WebMock.stub_request(:any, /api\.openai\.com/).to_return(
      status: 200,
      body: { choices: [{ text: "test response" }] }.to_json,
      headers: { "Content-Type" => "application/json" }
    )

    # Exchange rates API stubs
    WebMock.stub_request(:any, /openexchangerates\.org/).to_return(
      status: 200,
      body: { rates: { USD: 1.0, EUR: 0.85 } }.to_json,
      headers: { "Content-Type" => "application/json" }
    )

    # Discord API stubs
    WebMock.stub_request(:any, /discord\.com/).to_return(
      status: 200,
      body: { id: "test_discord_message" }.to_json,
      headers: { "Content-Type" => "application/json" }
    )

    # Generic webhook stubs
    WebMock.stub_request(:post, /webhook/).to_return(
      status: 200,
      body: "OK"
    )
  end
end

# Setup stubs when this file is required
ComprehensiveWebMockStubs.setup_all_stubs if defined?(WebMock)
