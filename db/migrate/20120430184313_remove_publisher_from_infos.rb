# frozen_string_literal: true

class RemovePublisherFromInfos < ActiveRecord::Migration[7.1]
  def up
    remove_column :infos, :publisher
  end

  def down
    add_column :infos, :publisher, :string
  end
end
