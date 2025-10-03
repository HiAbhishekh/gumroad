# frozen_string_literal: true

class RemoveOldProductTags < ActiveRecord::Migration[7.1]
  def change
    drop_table :product_tags
  end
end
