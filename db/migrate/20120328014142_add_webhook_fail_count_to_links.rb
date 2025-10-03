# frozen_string_literal: true

class AddWebhookFailCountToLinks < ActiveRecord::Migration[7.1]
  def change
    add_column :links, :webhook_fail_count, :integer
  end
end
