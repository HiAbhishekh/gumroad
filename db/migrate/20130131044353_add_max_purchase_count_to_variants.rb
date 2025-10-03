# frozen_string_literal: true

class AddMaxPurchaseCountToVariants < ActiveRecord::Migration[7.1]
  def change
    add_column :variants, :max_purchase_count, :integer
  end
end
