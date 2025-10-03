# frozen_string_literal: true

class AddLinkToPurchase < ActiveRecord::Migration[7.1]
  def change
    add_column :purchases, :link_id, :integer
  end
end
