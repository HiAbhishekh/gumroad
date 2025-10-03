# frozen_string_literal: true

class AddHeightToInfos < ActiveRecord::Migration[7.1]
  def change
    add_column :infos, :height, :integer
  end
end
