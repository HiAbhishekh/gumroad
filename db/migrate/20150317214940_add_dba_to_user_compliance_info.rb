# frozen_string_literal: true

class AddDbaToUserComplianceInfo < ActiveRecord::Migration[7.1]
  def change
    add_column :user_compliance_info, :dba, :string
  end
end
