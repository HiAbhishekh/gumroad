# frozen_string_literal: true

class RemoveStripeFingerpringUniqueness < ActiveRecord::Migration[7.1]
  def change
    remove_index :credit_cards, name: "index_credit_cards_on_stripe_fingerprint_unique"
    add_index :credit_cards, :stripe_fingerprint
  end
end
