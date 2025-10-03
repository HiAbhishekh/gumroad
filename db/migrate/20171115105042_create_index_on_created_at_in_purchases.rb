# frozen_string_literal: true

class CreateIndexOnCreatedAtInPurchases < ActiveRecord::Migration[7.1]
  def change
    add_index :purchases, :created_at
  end
end
