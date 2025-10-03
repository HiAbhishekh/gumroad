# frozen_string_literal: true

class AddDeletedAtToOauthApplications < ActiveRecord::Migration[7.1]
  def change
    add_column :oauth_applications, :deleted_at, :datetime
  end
end
