# frozen_string_literal: true

class AddVariantRefToInstallments < ActiveRecord::Migration[7.1]
  def change
    add_reference :installments, :base_variant, index: true
  end
end
