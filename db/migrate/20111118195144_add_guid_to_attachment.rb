# frozen_string_literal: true

class AddGuidToAttachment < ActiveRecord::Migration[7.1]
  def change
    add_column :attachments, :file_guid, :string
  end
end
