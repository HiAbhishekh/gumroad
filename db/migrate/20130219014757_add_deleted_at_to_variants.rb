# frozen_string_literal: true

class AddDeletedAtToVariants < ActiveRecord::Migration[7.1]
  def change
    add_column :variants, :deleted_at, :datetime
  end
end
