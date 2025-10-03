# frozen_string_literal: true

class DropReceiptsTable < ActiveRecord::Migration[7.1]
  def up
    drop_table :receipts
  end

  def down
  end
end
