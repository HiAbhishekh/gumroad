# frozen_string_literal: true

class RemoveOtherCategory < ActiveRecord::Migration[7.1]
  def up
    execute "DELETE FROM categories WHERE name = 'other'"
  end

  def down
    execute "INSERT INTO categories (name, created_at, updated_at) VALUES ('other', NOW(), NOW())"
  end
end
