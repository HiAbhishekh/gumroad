# frozen_string_literal: true

class AddBannedToBlockedIps < ActiveRecord::Migration[7.1]
  def change
    add_column :blocked_ips, :banned, :boolean
  end
end
