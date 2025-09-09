FactoryBot.define do
  factory :user do
    sequence(:email) { |n| "user#{n}@example.com" }
    password { "password123" }
    currency_type { "usd" }
  end

  factory :named_seller, parent: :user do
    name { "Test Seller" }
  end

  factory :named_user, parent: :user do
    name { "Gumhead Moneybags" }
  end

  factory :user_with_compliance_info, parent: :user do
    name { "Test User" }
    # Add compliance info attributes as needed
    user_risk_state { "compliant" }
    payment_address { "test@example.com" }
  end

  factory :affiliate_user, parent: :user do
    name { "Affiliate User" }
  end
end