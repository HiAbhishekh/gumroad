# frozen_string_literal: true

class AddPositionToAssetPreviews < ActiveRecord::Migration[7.1]
  def change
    add_column :asset_previews, :position, :integer
  end
end
