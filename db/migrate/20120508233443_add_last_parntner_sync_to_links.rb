# frozen_string_literal: true

class AddLastParntnerSyncToLinks < ActiveRecord::Migration[7.1]
  def change
    add_column :links, :last_partner_sync, :timestamp
  end
end
