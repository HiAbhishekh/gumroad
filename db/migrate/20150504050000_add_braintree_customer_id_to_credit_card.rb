# frozen_string_literal: true

class AddBraintreeCustomerIdToCreditCard < ActiveRecord::Migration[7.1]
  def change
    add_column :credit_cards, :braintree_customer_id, :string
  end
end
