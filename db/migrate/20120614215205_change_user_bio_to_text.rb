# frozen_string_literal: true

class ChangeUserBioToText < ActiveRecord::Migration[7.1]
  def up
    change_column :users, :bio, :text
  end

  def down
    change_column :users, :bio, :string
  end
end
