# frozen_string_literal: true

class AddSomeNewFieldsToPayments < ActiveRecord::Migration[7.1]
  def change
    add_column :payments, :txn_id, :string
    add_column :payments, :unique_id, :string
  end
end
