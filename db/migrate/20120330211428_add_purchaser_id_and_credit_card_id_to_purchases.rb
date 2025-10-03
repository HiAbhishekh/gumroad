# frozen_string_literal: true

class AddPurchaserIdAndCreditCardIdToPurchases < ActiveRecord::Migration[7.1]
  def change
    change_table :purchases do |t|
      t.references :credit_card
      t.rename :user_id, :seller_id
      t.references :purchaser, polymorphic: { default: "User" }
    end
  end
end
