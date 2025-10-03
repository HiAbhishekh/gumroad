# frozen_string_literal: true

class AddUnbannableToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :unbannable, :boolean, default: false
  end
end
