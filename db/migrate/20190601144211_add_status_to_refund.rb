# frozen_string_literal: true

class AddStatusToRefund < ActiveRecord::Migration[7.1]
  def change
    add_column :refunds, :status, :string
  end
end
