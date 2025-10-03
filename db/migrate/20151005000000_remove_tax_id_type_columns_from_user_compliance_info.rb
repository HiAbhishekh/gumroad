# frozen_string_literal: true

class RemoveTaxIdTypeColumnsFromUserComplianceInfo < ActiveRecord::Migration[7.1]
  def change
    remove_column :user_compliance_info, :individual_tax_id_type
    remove_column :user_compliance_info, :business_tax_id_type
  end
end
