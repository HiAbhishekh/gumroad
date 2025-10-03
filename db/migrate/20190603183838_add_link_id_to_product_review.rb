# frozen_string_literal: true

class AddLinkIdToProductReview < ActiveRecord::Migration[7.1]
  def up
    add_column :product_reviews, :link_id, :integer
  end

  def down
    remove_column :product_reviews, :link_id
  end
end
