# frozen_string_literal: true

class AddTitleToVariantCategories < ActiveRecord::Migration[7.1]
  def change
    add_column :variant_categories, :title, :string
  end
end
