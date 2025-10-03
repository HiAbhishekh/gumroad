# frozen_string_literal: true

class AddCustomizablePriceFlagToLink < ActiveRecord::Migration[7.1]
  def change
    add_column :links, :customizable_price, :boolean
  end
end
