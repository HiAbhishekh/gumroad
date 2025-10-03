# frozen_string_literal: true

class AddMerchantIdToCredit < ActiveRecord::Migration[7.1]
  def change
    add_column :credits, :merchant_account_id, :integer
  end
end
