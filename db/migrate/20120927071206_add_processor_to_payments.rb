# frozen_string_literal: true

class AddProcessorToPayments < ActiveRecord::Migration[7.1]
  def change
    add_column :payments, :processor, :string
  end
end
