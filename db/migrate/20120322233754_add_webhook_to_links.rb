# frozen_string_literal: true

class AddWebhookToLinks < ActiveRecord::Migration[7.1]
  def change
    add_column :links, :webhook, :boolean
  end
end
