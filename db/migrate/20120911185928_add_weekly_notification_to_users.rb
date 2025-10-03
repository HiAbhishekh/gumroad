# frozen_string_literal: true

class AddWeeklyNotificationToUsers < ActiveRecord::Migration[7.1]
  def up
    add_column :users, :weekly_notification, :boolean, default: true
  end

  def down
    remove_column :users, :weekly_notification
  end
end
