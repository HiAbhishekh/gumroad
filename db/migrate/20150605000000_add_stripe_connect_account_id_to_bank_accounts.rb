# frozen_string_literal: true

class AddStripeConnectAccountIdToBankAccounts < ActiveRecord::Migration[7.1]
  def change
    add_column :bank_accounts, :stripe_connect_account_id, :string
  end
end
