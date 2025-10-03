# frozen_string_literal: true

class AddReferrerToPurchases < ActiveRecord::Migration[7.1]
  def change
    add_column :purchases, :referrer, :string
  end
end
