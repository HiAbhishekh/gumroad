# frozen_string_literal: true

class DeleteDefaultForLinksPriceCents < ActiveRecord::Migration[7.1]
  def up
    change_column_default :links, :price_cents, nil
  end

  def down
    change_column_default :links, :price_cents, 0
  end
end
