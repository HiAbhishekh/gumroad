# frozen_string_literal: true

class AddJsonDataToPurchases < ActiveRecord::Migration[7.1]
  def change
    add_column :purchases, :json_data, :string
  end
end
