# frozen_string_literal: true

class AddIndexOnLinkIdToVariantCategories < ActiveRecord::Migration[7.1]
  def change
    add_index :variant_categories, :link_id
  end
end
