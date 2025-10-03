# frozen_string_literal: true

class AddPurchaseIdToSubscriptions < ActiveRecord::Migration[7.1]
  def change
    add_column :subscriptions, :purchase_id, :integer
  end
end
