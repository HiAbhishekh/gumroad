# frozen_string_literal: true

class IndexTranscodedVideosOnProductFileId < ActiveRecord::Migration[7.1]
  def up
    add_index :transcoded_videos, :product_file_id
  end

  def down
    remove_index :transcoded_videos, :product_file_id
  end
end
