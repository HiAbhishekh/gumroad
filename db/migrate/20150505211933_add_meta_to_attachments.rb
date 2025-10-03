# frozen_string_literal: true

class AddMetaToAttachments < ActiveRecord::Migration[7.1]
  def change
    add_column(:asset_previews, :attachment_meta, :text)
  end
end
