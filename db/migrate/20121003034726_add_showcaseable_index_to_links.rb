# frozen_string_literal: true

class AddShowcaseableIndexToLinks < ActiveRecord::Migration[7.1]
  def change
    add_index :links, :showcaseable
  end
end
