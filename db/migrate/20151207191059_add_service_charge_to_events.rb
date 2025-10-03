# frozen_string_literal: true

class AddServiceChargeToEvents < ActiveRecord::Migration[7.1]
  def change
    add_column :events, :service_charge_id, :integer
  end
end
