# frozen_string_literal: true

class AttachmentAddUserId < ActiveRecord::Migration[7.1]
  def change
    add_column :attachments, :user_id, :integer
  end
end
