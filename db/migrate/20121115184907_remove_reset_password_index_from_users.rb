# frozen_string_literal: true

class RemoveResetPasswordIndexFromUsers < ActiveRecord::Migration[7.1]
  def up
    remove_index "users", "reset_password_token"
  end

  def down
    add_index "users", "reset_password_token"
  end
end
