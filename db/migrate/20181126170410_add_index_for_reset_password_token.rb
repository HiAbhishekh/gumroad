# frozen_string_literal: true

class AddIndexForResetPasswordToken < ActiveRecord::Migration[7.1]
  def change
    add_index :users, :reset_password_token
  end
end
