# frozen_string_literal: true

class AddCountryToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :country, :string
  end
end
