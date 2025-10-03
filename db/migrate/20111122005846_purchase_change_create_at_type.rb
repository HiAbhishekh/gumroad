# frozen_string_literal: true

class PurchaseChangeCreateAtType < ActiveRecord::Migration[7.1]
  def change
    change_column(:purchases, :created_at, :datetime)
  end
end
