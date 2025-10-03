# frozen_string_literal: true

class AddTerritoryRestrictionToLinks < ActiveRecord::Migration[7.1]
  def change
    add_column :links, :territory_restriction, :string
  end
end
