# frozen_string_literal: true

class AddFramerateToLinks < ActiveRecord::Migration[7.1]
  def change
    add_column :links, :framerate, :integer
  end
end
