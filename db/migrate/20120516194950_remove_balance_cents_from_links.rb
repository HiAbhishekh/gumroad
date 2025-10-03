# frozen_string_literal: true

class RemoveBalanceCentsFromLinks < ActiveRecord::Migration[7.1]
  def up
    remove_column :links, :balance_cents
  end

  def down
    add_column :links, :balance_cents, :integer
  end
end
