# frozen_string_literal: true

class AddExternalMappingIdToLinks < ActiveRecord::Migration[7.1]
  def change
    add_column :links, :external_mapping_id, :string
  end
end
