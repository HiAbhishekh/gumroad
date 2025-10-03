# frozen_string_literal: true

class AddCustomDownloadTextToLinks < ActiveRecord::Migration[7.1]
  def change
    add_column :links, :custom_download_text, :string
  end
end
