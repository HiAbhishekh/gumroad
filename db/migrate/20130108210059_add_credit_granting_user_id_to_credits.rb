# frozen_string_literal: true

class AddCreditGrantingUserIdToCredits < ActiveRecord::Migration[7.1]
  def change
    add_column :credits, :crediting_user_id, :integer
  end
end
