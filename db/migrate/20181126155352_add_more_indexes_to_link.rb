# frozen_string_literal: true

class AddMoreIndexesToLink < ActiveRecord::Migration[7.1]
  def change
    add_index :links, :banned_at
    add_index :links, :deleted_at
  end
end
