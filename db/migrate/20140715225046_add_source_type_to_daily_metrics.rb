# frozen_string_literal: true

class AddSourceTypeToDailyMetrics < ActiveRecord::Migration[7.1]
  def change
    add_column :daily_metrics, :source_type, :string, default: "all"
  end
end
