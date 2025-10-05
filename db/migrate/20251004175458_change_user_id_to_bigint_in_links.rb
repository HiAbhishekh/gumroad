# frozen_string_literal: true

class ChangeUserIdToBigintInLinks < ActiveRecord::Migration[7.1]
  def up
    change_column :links, :user_id, :bigint
  end

  def down
    change_column :links, :user_id, :integer
  end
end
