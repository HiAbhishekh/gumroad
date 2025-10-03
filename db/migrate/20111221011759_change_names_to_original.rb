# frozen_string_literal: true

class ChangeNamesToOriginal < ActiveRecord::Migration[7.1]
  def up
    # Use raw SQL to avoid model loading issues
    # This migration renames file names to "original" with the same extension
    execute "UPDATE attachments SET file_file_name = CONCAT('original', SUBSTRING_INDEX(file_file_name, '.', -1)) WHERE file_file_name IS NOT NULL"
  end

  def down
  end
end
