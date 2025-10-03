# frozen_string_literal: true

class AddIndexToUsersExternalId < ActiveRecord::Migration[7.1]
  def up
    add_index :users, :external_id
  end

  def down
    remove_index :users, :external_id
  end
end
