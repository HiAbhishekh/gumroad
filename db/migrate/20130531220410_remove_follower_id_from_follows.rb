# frozen_string_literal: true

class RemoveFollowerIdFromFollows < ActiveRecord::Migration[7.1]
  def change
    remove_column :follows, :follower_id
  end
end
