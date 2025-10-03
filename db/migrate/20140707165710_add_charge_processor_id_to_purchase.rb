# frozen_string_literal: true

class AddChargeProcessorIdToPurchase < ActiveRecord::Migration[7.1]
  def up
    add_column :purchases, :charge_processor_id, :string
    Purchase.where("stripe_transaction_id IS NOT NULL").update_all(charge_processor_id: "stripe")
  end

  def down
    remove_column :purchases, :charge_processor_id
  end
end
