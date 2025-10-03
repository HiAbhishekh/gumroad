# frozen_string_literal: true

class AddFilegroupToLinks < ActiveRecord::Migration[7.1]
  def change
    add_column :links, :filegroup, :string
  end
end
