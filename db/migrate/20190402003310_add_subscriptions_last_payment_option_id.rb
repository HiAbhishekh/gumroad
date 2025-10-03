# frozen_string_literal: true

class AddSubscriptionsLastPaymentOptionId < ActiveRecord::Migration[7.1]
  def change
    add_column :subscriptions, :last_payment_option_id, :integer
  end
end
