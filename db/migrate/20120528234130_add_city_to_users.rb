# frozen_string_literal: true

class AddCityToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :city, :string
  end
end
