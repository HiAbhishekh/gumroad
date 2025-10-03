# frozen_string_literal: true

class ChangeFollowToFollower < ActiveRecord::Migration[7.1]
  def up
    rename_table :follows, :followers
  end

  def down
    rename_table :followers, :follows
  end
end
