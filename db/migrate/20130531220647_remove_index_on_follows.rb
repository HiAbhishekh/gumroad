# frozen_string_literal: true

class RemoveIndexOnFollows < ActiveRecord::Migration[7.1]
  def up
    # Skip this migration to avoid primary key issues
    puts("Skipping index removal to avoid primary key issues")
  end

  def down
    # No-op
  end
end
