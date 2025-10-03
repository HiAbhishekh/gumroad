# frozen_string_literal: true

class AddBanFlagToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :ban_flag, :boolean
  end
end
