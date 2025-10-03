# frozen_string_literal: true

class AddGoogleAnalyticsDomainsToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :google_analytics_domains, :string
  end
end
