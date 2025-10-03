# frozen_string_literal: true

class AddPublishedAtToInstallments < ActiveRecord::Migration[7.1]
  def change
    add_column :installments, :published_at, :datetime
  end
end
