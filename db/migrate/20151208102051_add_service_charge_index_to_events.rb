# frozen_string_literal: true

class AddServiceChargeIndexToEvents < ActiveRecord::Migration[7.1]
  def change
    add_index :events, :service_charge_id
  end
end
