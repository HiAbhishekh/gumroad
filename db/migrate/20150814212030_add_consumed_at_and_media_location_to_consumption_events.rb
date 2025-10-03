# frozen_string_literal: true

class AddConsumedAtAndMediaLocationToConsumptionEvents < ActiveRecord::Migration[7.1]
  def change
    add_column :consumption_events, :consumed_at, :datetime
    add_column :consumption_events, :media_location, :integer
  end
end
