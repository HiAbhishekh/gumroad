# frozen_string_literal: true

class AddStripeErrorCodeToPurchases < ActiveRecord::Migration[7.1]
  def change
    add_column :purchases, :stripe_error_code, :string
  end
end
