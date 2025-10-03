# frozen_string_literal: true

class AddFiletypeToLinks < ActiveRecord::Migration[7.1]
  def change
    add_column :links, :filetype, :string
  end
end
