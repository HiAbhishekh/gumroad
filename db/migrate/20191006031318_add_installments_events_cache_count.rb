# frozen_string_literal: true

class AddInstallmentsEventsCacheCount < ActiveRecord::Migration[7.1]
  def up
    add_column :installments, :installment_events_count, :integer
  end

  def down
    remove_column :installments, :installment_events_count
  end
end
