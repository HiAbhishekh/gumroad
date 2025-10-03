# frozen_string_literal: true

class AddBaseVariantToWorkflows < ActiveRecord::Migration[7.1]
  def change
    add_reference :workflows, :base_variant, index: true
  end
end
