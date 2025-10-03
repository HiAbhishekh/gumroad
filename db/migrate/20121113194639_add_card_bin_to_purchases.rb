# frozen_string_literal: true

class AddCardBinToPurchases < ActiveRecord::Migration[7.1]
  def change
    add_column :purchases, :card_bin, :string
  end
end
