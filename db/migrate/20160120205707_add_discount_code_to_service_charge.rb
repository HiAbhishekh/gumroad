# frozen_string_literal: true

class AddDiscountCodeToServiceCharge < ActiveRecord::Migration[7.1]
  def change
    add_column :service_charges, :discount_code, :string, limit: 100
  end
end
