# frozen_string_literal: true

class AddWidthToLinks < ActiveRecord::Migration[7.1]
  def change
    add_column :links, :width, :integer
  end
end
