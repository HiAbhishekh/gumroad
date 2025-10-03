# frozen_string_literal: true

class RemoveSoundscanFromLinks < ActiveRecord::Migration[7.1]
  def change
    remove_column :links, :soundscan
  end
end
