# frozen_string_literal: true

class AddBrowserPluginsToEventsAndVisits < ActiveRecord::Migration[7.1]
  def up
    add_column :events, :browser_plugins, :string
  end

  def down
    remove_column :events, :browser_plugins
  end
end
