# frozen_string_literal: true

class AddUsernameToUsers < ActiveRecord::Migration[7.1]
  def change
    change_table :users do |t|
      t.string :username
    end
  end
end
