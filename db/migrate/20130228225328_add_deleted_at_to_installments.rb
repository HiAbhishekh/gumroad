# frozen_string_literal: true

class AddDeletedAtToInstallments < ActiveRecord::Migration[7.1]
  def change
    add_column :installments, :deleted_at, :datetime
  end
end
