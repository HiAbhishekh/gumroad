# frozen_string_literal: true

class AddBannedAtToBlockedIp < ActiveRecord::Migration[7.1]
  def change
    add_column :blocked_ips, :banned_at, :timestamp
  end
end
