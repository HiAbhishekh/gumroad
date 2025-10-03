# frozen_string_literal: true

class AddCountryToMerchantAccounts < ActiveRecord::Migration[7.1]
  def change
    add_column :merchant_accounts, :country, :string, default: "US"
  end
end
