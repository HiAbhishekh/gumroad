# frozen_string_literal: true

class AddEmailIndexToImportedCustomer < ActiveRecord::Migration[7.1]
  def change
    add_index :imported_customers, :email
  end
end
