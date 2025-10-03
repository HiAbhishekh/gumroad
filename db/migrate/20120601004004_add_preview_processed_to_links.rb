# frozen_string_literal: true

class AddPreviewProcessedToLinks < ActiveRecord::Migration[7.1]
  def change
    add_column :links, :preview_processed, :boolean
  end
end
