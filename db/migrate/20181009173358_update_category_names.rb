# frozen_string_literal: true

class UpdateCategoryNames < ActiveRecord::Migration[7.1]
  def up
    execute "UPDATE categories SET name = 'writing' WHERE name = 'publishing'"
    execute "UPDATE categories SET name = 'merchandise' WHERE name = 'physical'"
  end

  def down
    execute "UPDATE categories SET name = 'physical' WHERE name = 'merchandise'"
    execute "UPDATE categories SET name = 'publishing' WHERE name = 'writing'"
  end
end
