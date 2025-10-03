# frozen_string_literal: true

class AddLanguageToInfos < ActiveRecord::Migration[7.1]
  def change
    add_column :infos, :language, :string
  end
end
