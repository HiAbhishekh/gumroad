# frozen_string_literal: true

class AddCardDataHandlingToCreditCard < ActiveRecord::Migration[7.1]
  def change
    add_column :credit_cards, :card_data_handling_mode, :string
  end
end
