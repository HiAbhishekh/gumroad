# frozen_string_literal: true

class AddFanpageToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :fanpage, :string
  end
end
