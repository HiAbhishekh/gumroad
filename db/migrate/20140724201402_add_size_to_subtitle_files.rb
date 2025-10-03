# frozen_string_literal: true

class AddSizeToSubtitleFiles < ActiveRecord::Migration[7.1]
  def change
    add_column :subtitle_files, :size, :integer
  end
end
