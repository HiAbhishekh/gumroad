# frozen_string_literal: true

class RemoveLanguageFromInfos < ActiveRecord::Migration[7.1]
  def up
    remove_column :infos, :language
  end

  def down
    add_column :infos, :language, :string
  end
end
