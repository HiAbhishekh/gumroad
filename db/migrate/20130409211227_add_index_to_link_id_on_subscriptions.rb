# frozen_string_literal: true

class AddIndexToLinkIdOnSubscriptions < ActiveRecord::Migration[7.1]
  def change
    add_index :subscriptions, :link_id
  end
end
