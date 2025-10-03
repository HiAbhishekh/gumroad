# frozen_string_literal: true

class AddDefaultToPreviewProcessed < ActiveRecord::Migration[7.1]
  def up
    change_column :links, :preview_processed, :boolean, default: true
  end

  def down
    change_column :links, :preview_processed, :boolean, default: nil
  end
end
