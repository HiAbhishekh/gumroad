# frozen_string_literal: true

class AddSellerIdToInstallments < ActiveRecord::Migration[7.1]
  def change
    add_column :installments, :seller_id, :integer
  end
end
