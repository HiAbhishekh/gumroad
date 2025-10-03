# frozen_string_literal: true

class AddCurrencyTypeToOfferCodes < ActiveRecord::Migration[7.1]
  def change
    add_column :offer_codes, :currency_type, :string
  end
end
