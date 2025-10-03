# frozen_string_literal: true

class AddPublisherToInfos < ActiveRecord::Migration[7.1]
  def change
    add_column :infos, :publisher, :string
  end
end
