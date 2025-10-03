# frozen_string_literal: true

class CreateProductFilesArchives < ActiveRecord::Migration[7.1]
  def change
    create_table :product_files_archives do |t|
      t.timestamp :deleted_at
      t.belongs_to :link
      t.belongs_to :installment
      t.string :zip_archive_file_file_name
      t.string :zip_archive_file_content_type
      t.integer :zip_archive_file_file_size
      t.datetime :zip_archive_file_updated_at
      t.string :product_files_archive_state

      t.timestamps
    end

    add_index :product_files_archives, :link_id
    add_index :product_files_archives, :installment_id

    create_table :product_files_files_archives do |t|
      t.references :product_file
      t.references :product_files_archive
    end

    add_index :product_files_files_archives, :product_files_archive_id
  end
end
