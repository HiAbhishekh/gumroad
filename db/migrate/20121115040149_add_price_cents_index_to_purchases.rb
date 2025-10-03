# frozen_string_literal: true

class AddPriceCentsIndexToPurchases < ActiveRecord::Migration[7.1]
  def up
    add_index "purchases", ["price_cents"]
  end

  def down
    remove_index "purchases", ["price_cents"]
  end
end
