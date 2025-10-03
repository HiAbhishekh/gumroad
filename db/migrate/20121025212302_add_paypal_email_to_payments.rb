# frozen_string_literal: true

class AddPaypalEmailToPayments < ActiveRecord::Migration[7.1]
  def up
    add_column :payments, :payment_address, :string
  end
end
