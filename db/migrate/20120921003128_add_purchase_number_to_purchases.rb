# frozen_string_literal: true

class AddPurchaseNumberToPurchases < ActiveRecord::Migration[7.1]
  def change
    add_column :purchases, :purchase_number, :integer
  end
end
