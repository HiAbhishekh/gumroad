# frozen_string_literal: true

class DropDocuments < ActiveRecord::Migration[7.1]
  def change
    drop_table :documents
  end
end
