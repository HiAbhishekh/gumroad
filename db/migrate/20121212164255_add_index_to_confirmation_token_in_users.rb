# frozen_string_literal: true

class AddIndexToConfirmationTokenInUsers < ActiveRecord::Migration[7.1]
  def change
    add_index :users, :confirmation_token
  end
end
