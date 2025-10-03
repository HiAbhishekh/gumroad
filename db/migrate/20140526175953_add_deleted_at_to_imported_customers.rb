# frozen_string_literal: true

class AddDeletedAtToImportedCustomers < ActiveRecord::Migration[7.1]
  def change
    add_column :imported_customers, :deleted_at, :datetime
  end
end
