# frozen_string_literal: true

class AddRecommendationTypeToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :recommendation_type, :string, default: User::RecommendationType::SAME_CREATOR_PRODUCTS, null: false
  end
end
