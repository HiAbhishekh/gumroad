# frozen_string_literal: true

class AddStripeFingerPrintToCreditCards < ActiveRecord::Migration[7.1]
  def change
    add_column :credit_cards, :stripe_fingerprint, :string
  end
end
