# frozen_string_literal: true

class AddDeletedAtToResourceSubscriptions < ActiveRecord::Migration[7.1]
  def change
    add_column :resource_subscriptions, :deleted_at, :datetime
  end
end
