# frozen_string_literal: true

class AddLinkIdIndexToBaseVariants < ActiveRecord::Migration[7.1]
  def change
    add_index :base_variants, :link_id
  end
end
