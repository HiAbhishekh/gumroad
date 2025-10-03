# frozen_string_literal: true

class AddAffiliateCreditCentsToPurchase < ActiveRecord::Migration[7.1]
  def change
    add_column :purchases, :affiliate_credit_cents, :integer, default: 0
  end
end
