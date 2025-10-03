# frozen_string_literal: true

class AddAttachmentIconToOauthApplications < ActiveRecord::Migration[7.1]
  def up
    add_column :oauth_applications, :icon_file_name, :string
    add_column :oauth_applications, :icon_content_type, :string
    add_column :oauth_applications, :icon_file_size, :integer
    add_column :oauth_applications, :icon_updated_at, :datetime
  end

  def down
    remove_column :oauth_applications, :icon_file_name
    remove_column :oauth_applications, :icon_content_type
    remove_column :oauth_applications, :icon_file_size
    remove_column :oauth_applications, :icon_updated_at
  end
end
