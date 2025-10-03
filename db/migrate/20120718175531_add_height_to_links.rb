# frozen_string_literal: true

class AddHeightToLinks < ActiveRecord::Migration[7.1]
  def change
    add_column :links, :height, :integer
  end
end
