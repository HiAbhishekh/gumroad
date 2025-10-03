# frozen_string_literal: true

class AddPreviewOembedToLinks < ActiveRecord::Migration[7.1]
  def change
    add_column :links, :preview_oembed, :text
  end
end
