# frozen_string_literal: true

class AddReturnedPaymentToCredit < ActiveRecord::Migration[7.1]
  def change
    add_column :credits, :returned_payment_id, :integer
  end
end
