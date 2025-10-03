# frozen_string_literal: true

class AddDurationToLinks < ActiveRecord::Migration[7.1]
  def change
    add_column :links, :duration, :integer
  end
end
