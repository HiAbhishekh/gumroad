# frozen_string_literal: true

class AddIndexToLinkIdOnInstallments < ActiveRecord::Migration[7.1]
  def change
    add_index :installments, :link_id
  end
end
