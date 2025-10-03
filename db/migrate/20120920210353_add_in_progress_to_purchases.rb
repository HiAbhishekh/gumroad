# frozen_string_literal: true

class AddInProgressToPurchases < ActiveRecord::Migration[7.1]
  def change
    add_column :purchases, :in_progress, :boolean, default: false
  end
end
