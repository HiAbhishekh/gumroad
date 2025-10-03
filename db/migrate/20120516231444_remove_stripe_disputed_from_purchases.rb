# frozen_string_literal: true

class RemoveStripeDisputedFromPurchases < ActiveRecord::Migration[7.1]
  def up
    remove_column :purchases, :stripe_disputed
  end

  def down
    add_column :purchases, :stripe_disputed, :boolean
  end
end
