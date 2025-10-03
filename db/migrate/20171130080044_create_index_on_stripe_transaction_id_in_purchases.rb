# frozen_string_literal: true

class CreateIndexOnStripeTransactionIdInPurchases < ActiveRecord::Migration[7.1]
  def change
    add_index :purchases, :stripe_transaction_id
  end
end
