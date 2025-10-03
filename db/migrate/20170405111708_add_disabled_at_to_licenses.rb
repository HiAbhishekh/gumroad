# frozen_string_literal: true

class AddDisabledAtToLicenses < ActiveRecord::Migration[7.1]
  def change
    add_column :licenses, :disabled_at, :datetime
  end
end
