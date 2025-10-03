# frozen_string_literal: true

class ChangeStatusToStateInPayments < ActiveRecord::Migration[7.1]
  def up
    rename_column :payments, :status, :state
  end

  def down
    rename_column :payments, :state, :status
  end
end
