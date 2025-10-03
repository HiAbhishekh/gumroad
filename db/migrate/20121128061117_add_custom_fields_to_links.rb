# frozen_string_literal: true

class AddCustomFieldsToLinks < ActiveRecord::Migration[7.1]
  def change
    add_column :links, :custom_fields, :text
  end
end
