# frozen_string_literal: true

class RemoveIndexOnDeletedAt < ActiveRecord::Migration[7.1]
  def change
    remove_index :links, :deleted_at
  end
end
