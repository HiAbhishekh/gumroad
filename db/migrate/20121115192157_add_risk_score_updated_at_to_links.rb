# frozen_string_literal: true

class AddRiskScoreUpdatedAtToLinks < ActiveRecord::Migration[7.1]
  def change
    add_column :links, :risk_score_updated_at, :datetime
  end
end
