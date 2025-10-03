# frozen_string_literal: true

class RemoveEventNameIndexOnEvents < ActiveRecord::Migration[7.1]
  def up
    # Skip if index doesn't exist
    if index_exists?("events", "event_type")
      remove_index "events", "event_type"
    end
  end

  def down
    add_index "events", "event_type"
  end
end
