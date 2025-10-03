# frozen_string_literal: true

class AddJsonDataToInstallments < ActiveRecord::Migration[7.1]
  def change
    add_column :installments, :json_data, :text
  end
end
