# frozen_string_literal: true

class AddSessionIdToPurchases < ActiveRecord::Migration[7.1]
  def change
    add_column :purchases, :session_id, :string
  end
end
