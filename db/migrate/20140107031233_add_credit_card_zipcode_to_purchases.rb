# frozen_string_literal: true

class AddCreditCardZipcodeToPurchases < ActiveRecord::Migration[7.1]
  def change
    add_column :purchases, :credit_card_zipcode, :string
  end
end
