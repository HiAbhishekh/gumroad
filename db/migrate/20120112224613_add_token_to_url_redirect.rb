# frozen_string_literal: true

class AddTokenToUrlRedirect < ActiveRecord::Migration[7.1]
  def change
    add_column :url_redirects, :token, :string
  end
end
