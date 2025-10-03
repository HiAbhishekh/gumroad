# frozen_string_literal: true

class AddPagelengthToLinks < ActiveRecord::Migration[7.1]
  def change
    add_column :links, :pagelength, :integer
  end
end
