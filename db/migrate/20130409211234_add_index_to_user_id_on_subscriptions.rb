# frozen_string_literal: true

class AddIndexToUserIdOnSubscriptions < ActiveRecord::Migration[7.1]
  def change
    add_index :subscriptions, :user_id
  end
end
