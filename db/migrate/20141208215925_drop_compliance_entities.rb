# frozen_string_literal: true

class DropComplianceEntities < ActiveRecord::Migration[7.1]
  def change
    drop_table :compliance_entities
  end
end
