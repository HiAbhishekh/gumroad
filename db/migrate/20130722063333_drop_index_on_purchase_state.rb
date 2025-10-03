# frozen_string_literal: true

class DropIndexOnPurchaseState < ActiveRecord::Migration[7.1]
  def change
    remove_index :purchases, name: "index_purchases_on_purchase_state"
  end
end
