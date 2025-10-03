# frozen_string_literal: true

class AddIpStateToEvents < ActiveRecord::Migration[7.1]
  def change
    add_column :events, :ip_state, :string
  end
end
