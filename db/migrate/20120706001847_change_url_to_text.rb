# frozen_string_literal: true

class ChangeUrlToText < ActiveRecord::Migration[7.1]
  def up
    change_column :links, :url, :text
  end

  def down
    change_column :links, :url, :string
  end
end
