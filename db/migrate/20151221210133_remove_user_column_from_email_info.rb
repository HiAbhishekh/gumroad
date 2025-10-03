# frozen_string_literal: true

class RemoveUserColumnFromEmailInfo < ActiveRecord::Migration[7.1]
  def change
    remove_column :email_infos, :user_id
  end
end
