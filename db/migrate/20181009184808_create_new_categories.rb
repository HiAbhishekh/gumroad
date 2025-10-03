# frozen_string_literal: true

class CreateNewCategories < ActiveRecord::Migration[7.1]
  CATEGORY_NAMES = %w(comics drawing animation audio games photography comedy crafts food design dance sports)

  def up
    CATEGORY_NAMES.each do |category_name|
      execute "INSERT INTO categories (name, created_at, updated_at) VALUES ('#{category_name}', NOW(), NOW())"
    end
  end

  def down
    CATEGORY_NAMES.each do |category_name|
      execute "DELETE FROM categories WHERE name = '#{category_name}'"
    end
  end
end
