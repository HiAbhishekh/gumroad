# frozen_string_literal: true

class AddVariantsToPurchases < ActiveRecord::Migration[7.1]
  def change
    add_column :purchases, :variants, :text
  end
end
