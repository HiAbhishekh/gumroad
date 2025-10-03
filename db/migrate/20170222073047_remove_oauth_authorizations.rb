# frozen_string_literal: true

class RemoveOauthAuthorizations < ActiveRecord::Migration[7.1]
  def change
    drop_table :oauth_authorizations
  end
end
