# frozen_string_literal: true

class AddSubunsubToPurchases < ActiveRecord::Migration[7.1]
  def change
    add_column :purchases, :subunsub, :string
  end
end
