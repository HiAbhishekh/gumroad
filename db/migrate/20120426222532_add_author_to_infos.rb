# frozen_string_literal: true

class AddAuthorToInfos < ActiveRecord::Migration[7.1]
  def change
    add_column :infos, :author, :string
  end
end
