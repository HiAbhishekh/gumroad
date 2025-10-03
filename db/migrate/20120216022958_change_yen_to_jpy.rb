# frozen_string_literal: true

class ChangeYenToJpy < ActiveRecord::Migration[7.1]
  def up
    # Use raw SQL to avoid model loading issues
    execute "UPDATE users SET currency_type = 'jpy' WHERE currency_type = 'yen'"
    execute "UPDATE links SET price_currency_type = 'jpy' WHERE price_currency_type = 'yen'"
    execute "UPDATE purchases SET displayed_price_currency_type = 'jpy' WHERE displayed_price_currency_type = 'yen'"
  end

  def down
    # Use raw SQL to avoid model loading issues
    execute "UPDATE users SET currency_type = 'yen' WHERE currency_type = 'jpy'"
    execute "UPDATE links SET price_currency_type = 'yen' WHERE price_currency_type = 'jpy'"
    execute "UPDATE purchases SET displayed_price_currency_type = 'yen' WHERE displayed_price_currency_type = 'jpy'"
  end
end
