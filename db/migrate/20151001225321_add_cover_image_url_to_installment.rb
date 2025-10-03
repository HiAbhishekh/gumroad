# frozen_string_literal: true

class AddCoverImageUrlToInstallment < ActiveRecord::Migration[7.1]
  def change
    add_column(:installments, :cover_image_url, :string)
  end
end
