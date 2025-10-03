# frozen_string_literal: true

class AddKindleEmailToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :kindle_email, :string
  end
end
