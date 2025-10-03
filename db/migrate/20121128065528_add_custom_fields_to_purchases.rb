# frozen_string_literal: true

class AddCustomFieldsToPurchases < ActiveRecord::Migration[7.1]
  def change
    add_column :purchases, :custom_fields, :text
  end
end
