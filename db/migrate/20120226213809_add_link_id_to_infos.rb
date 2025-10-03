# frozen_string_literal: true

class AddLinkIdToInfos < ActiveRecord::Migration[7.1]
  def change
    add_column :infos, :link_id, :integer
  end
end
