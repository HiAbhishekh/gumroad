# frozen_string_literal: true

class AddSuggestedPriceCentsToLinks < ActiveRecord::Migration[7.1]
  def change
    add_column :links, :suggested_price_cents, :integer
  end
end
