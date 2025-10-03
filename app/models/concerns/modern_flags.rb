# frozen_string_literal: true

module ModernFlags
  extend ActiveSupport::Concern

  included do
    # Modern flags for user features
    # Delegate to FlagShihTzu for flag functionality
    include FlagShihTzu
  end
end
