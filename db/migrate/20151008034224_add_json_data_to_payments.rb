# frozen_string_literal: true

class AddJsonDataToPayments < ActiveRecord::Migration[7.1]
  def change
    add_column :payments, :json_data, :text
  end
end
