# frozen_string_literal: true

class AddBannedAtToLinks < ActiveRecord::Migration[7.1]
  def change
    add_column :links, :banned_at, :timestamp
  end
end
