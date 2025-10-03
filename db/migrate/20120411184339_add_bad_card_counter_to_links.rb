# frozen_string_literal: true

class AddBadCardCounterToLinks < ActiveRecord::Migration[7.1]
  def change
    add_column :links, :bad_card_counter, :integer, default: 0
  end
end
