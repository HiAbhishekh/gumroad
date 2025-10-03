# frozen_string_literal: true

class AddCurrencyToPayments < ActiveRecord::Migration[7.1]
  def change
    add_column :payments, :currency, :string, default: "usd"
  end
end
