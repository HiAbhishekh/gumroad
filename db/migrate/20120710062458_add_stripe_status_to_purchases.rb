# frozen_string_literal: true

class AddStripeStatusToPurchases < ActiveRecord::Migration[7.1]
  def change
    add_column :purchases, :stripe_status, :string
  end
end
