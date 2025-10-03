# frozen_string_literal: true

class AddBitrateToLinks < ActiveRecord::Migration[7.1]
  def change
    add_column :links, :bitrate, :integer
  end
end
