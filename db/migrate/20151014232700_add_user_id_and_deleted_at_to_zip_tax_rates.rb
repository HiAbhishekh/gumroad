# frozen_string_literal: true

class AddUserIdAndDeletedAtToZipTaxRates < ActiveRecord::Migration[7.1]
  def change
    add_column :zip_tax_rates, :user_id, :integer
    add_column :zip_tax_rates, :deleted_at, :datetime
    add_index :zip_tax_rates, [:user_id]
  end
end
