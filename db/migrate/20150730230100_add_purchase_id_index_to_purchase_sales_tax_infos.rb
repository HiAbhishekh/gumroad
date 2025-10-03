# frozen_string_literal: true

class AddPurchaseIdIndexToPurchaseSalesTaxInfos < ActiveRecord::Migration[7.1]
  def change
    add_index :purchase_sales_tax_infos, :purchase_id
  end
end
