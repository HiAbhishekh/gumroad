# frozen_string_literal: true

class AddThemes < ActiveRecord::Migration[7.1]
  def change
    add_column(:users, :theme, :string, limit: 100)
  end
end
