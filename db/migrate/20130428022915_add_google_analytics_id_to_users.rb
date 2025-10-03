# frozen_string_literal: true

class AddGoogleAnalyticsIdToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :google_analytics_id, :string
  end
end
