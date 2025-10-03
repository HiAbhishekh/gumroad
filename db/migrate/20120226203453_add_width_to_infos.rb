# frozen_string_literal: true

class AddWidthToInfos < ActiveRecord::Migration[7.1]
  def change
    add_column :infos, :width, :integer
  end
end
