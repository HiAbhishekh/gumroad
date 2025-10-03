# frozen_string_literal: true

class AddJsonDataToRefunds < ActiveRecord::Migration[7.1]
  def change
    add_column :refunds, :json_data, :text
  end
end
