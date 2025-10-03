# frozen_string_literal: true

class AddPreviewAutomaticallyGeneratedToLinks < ActiveRecord::Migration[7.1]
  def change
    add_column :links, :preview_automatically_generated, :boolean
  end
end
