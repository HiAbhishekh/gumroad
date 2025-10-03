# frozen_string_literal: true

class AddPurchaseStateToPurchases < ActiveRecord::Migration[7.1]
  def change
    add_column :purchases, :purchase_state, :string
  end
end
