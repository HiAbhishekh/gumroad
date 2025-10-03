# frozen_string_literal: true

class AddBackgroundColorToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :background_color, :string
  end
end
