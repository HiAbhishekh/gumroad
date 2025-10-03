# frozen_string_literal: true

class AddAssetPreviews < ActiveRecord::Migration[7.1]
  def change
    create_table :asset_previews, options: "DEFAULT CHARACTER SET=utf8 COLLATE=utf8_unicode_ci" do |t|
      t.belongs_to :link
      t.string     :attachment_file_name
      t.string     :attachment_content_type
      t.integer    :attachment_file_size
      t.datetime   :attachment_updated_at
      t.string     :guid
      t.text       :oembed
      t.timestamps
      t.datetime   :deleted_at
      t.index      :link_id
    end
  end
end
