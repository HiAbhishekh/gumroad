# frozen_string_literal: true

class IndexPurchasesOnOfferCodeId < ActiveRecord::Migration[7.1]
  def change
    add_index :purchases, :offer_code_id
  end
end
