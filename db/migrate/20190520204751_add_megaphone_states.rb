# frozen_string_literal: true

class AddMegaphoneStates < ActiveRecord::Migration[7.1]
  def change
    create_table :megaphone_states do |t|
      t.integer :user_id
      t.bigint :flags, null: false, default: 0
    end

    add_index :megaphone_states, :user_id, unique: true
  end
end
