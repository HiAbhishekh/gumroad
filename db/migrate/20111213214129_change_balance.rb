# frozen_string_literal: true

class ChangeBalance < ActiveRecord::Migration[7.1]
  def up
    add_column :links, :balance_cents, :integer
    
    # Use raw SQL to avoid model loading issues
    execute "UPDATE links SET balance_cents = balance * 100 WHERE balance IS NOT NULL"
  end

  def down
    remove_column :links, :balance_cents
  end
end
