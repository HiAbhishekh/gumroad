# frozen_string_literal: true

class ChangeHightlightColorToHighlightColor < ActiveRecord::Migration[7.1]
  def up
    rename_column :users, :hightlight_color, :highlight_color
  end

  def down
    rename_column :users, :highlight_color, :hightlight_color
  end
end
