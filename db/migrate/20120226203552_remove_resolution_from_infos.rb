# frozen_string_literal: true

class RemoveResolutionFromInfos < ActiveRecord::Migration[7.1]
  def up
    remove_column :infos, :resolution
  end

  def down
    add_column :infos, :resolution, :string
  end
end
