# frozen_string_literal: true

class AddIsMobileToPurchases < ActiveRecord::Migration[7.1]
  def change
    add_column :purchases, :is_mobile, :boolean
  end
end
