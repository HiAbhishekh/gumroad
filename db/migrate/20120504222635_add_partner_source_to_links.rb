# frozen_string_literal: true

class AddPartnerSourceToLinks < ActiveRecord::Migration[7.1]
  def change
    add_column :links, :partner_source, :string
  end
end
