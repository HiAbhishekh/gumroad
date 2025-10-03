# frozen_string_literal: true

class AddFlagsToUrlRedirects < ActiveRecord::Migration[7.1]
  def change
    add_column :url_redirects, :flags, :integer, default: 0, null: false
  end
end
