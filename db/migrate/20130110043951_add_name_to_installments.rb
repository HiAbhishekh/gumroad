# frozen_string_literal: true

class AddNameToInstallments < ActiveRecord::Migration[7.1]
  def change
    add_column :installments, :name, :string
  end
end
