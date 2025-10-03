# frozen_string_literal: true

class AddFriendActionsToEvents < ActiveRecord::Migration[7.1]
  def change
    add_column :events, :friend_actions, :text
  end
end
