# frozen_string_literal: true

class AddIndexToCustomPermalinkInLinks < ActiveRecord::Migration[7.1]
  def change
    add_index :links, :custom_permalink
  end
end
