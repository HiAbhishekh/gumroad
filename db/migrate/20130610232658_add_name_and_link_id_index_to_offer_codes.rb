# frozen_string_literal: true

class AddNameAndLinkIdIndexToOfferCodes < ActiveRecord::Migration[7.1]
  def change
    add_index :offer_codes, [:name, :link_id]
  end
end
