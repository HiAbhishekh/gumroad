# frozen_string_literal: true

class AddSellerIdIndexToPurchases < ActiveRecord::Migration[7.1]
  def change
    add_index :purchases, :seller_id
  end
end
