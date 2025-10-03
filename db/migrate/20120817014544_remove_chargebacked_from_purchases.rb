# frozen_string_literal: true

class RemoveChargebackedFromPurchases < ActiveRecord::Migration[7.1]
  def up
    remove_column :purchases, :chargebacked
  end

  def down
    add_column :purchases, :chargebacked, :boolean, default: false
  end
end
