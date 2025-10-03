# frozen_string_literal: true

class AddStreetAddressToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :street_address, :string
  end
end
