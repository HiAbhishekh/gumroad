# frozen_string_literal: true

class AddCurrencyToMerchantAccounts < ActiveRecord::Migration[7.1]
  def change
    add_column :merchant_accounts, :currency, :string, default: "usd"
  end
end
