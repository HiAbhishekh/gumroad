# frozen_string_literal: true

class AddRefundTransactionId < ActiveRecord::Migration[7.1]
  def change
    add_column :refunds, :processor_refund_id, :string
  end
end
