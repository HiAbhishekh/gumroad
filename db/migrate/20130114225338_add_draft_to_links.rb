# frozen_string_literal: true

class AddDraftToLinks < ActiveRecord::Migration[7.1]
  def change
    add_column :links, :draft, :boolean, default: false
  end
end
