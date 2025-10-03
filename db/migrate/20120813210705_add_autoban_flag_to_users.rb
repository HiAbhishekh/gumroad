# frozen_string_literal: true

class AddAutobanFlagToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :autoban_flag, :boolean
  end
end
