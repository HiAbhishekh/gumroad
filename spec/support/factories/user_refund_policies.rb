# frozen_string_literal: true

FactoryBot.define do
  factory :seller_refund_policy do
    seller { create(:user) }
    product_id { nil }
    type { "SellerRefundPolicy" }
    title { "30-day money back guarantee" }
    max_refund_period_in_days { RefundPolicy::DEFAULT_REFUND_PERIOD_IN_DAYS }
    fine_print { "This is a user-level refund policy" }
  end
end
