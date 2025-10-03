# frozen_string_literal: true

class AddCommonColorToLink < ActiveRecord::Migration[7.1]
  def change
    add_column :links, :common_color, :string
  end
end
