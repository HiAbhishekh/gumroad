# frozen_string_literal: true

module MockStripeConnect
  # Mock Stripe Connect functionality for tests
  def self.included(base)
    base.before do
      # Mock Stripe Connect responses
      allow(Stripe::Account).to receive(:retrieve).and_return(double(id: 'acct_test'))
    end
  end
end
