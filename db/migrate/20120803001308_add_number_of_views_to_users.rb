# frozen_string_literal: true

class AddNumberOfViewsToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :number_of_views, :integer
  end
end
