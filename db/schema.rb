# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.1].define(version: 2025_10_04_175458) do
  create_table "ab_tests", charset: "utf8mb4", collation: "utf8mb4_unicode_ci", force: :cascade do |t|
    t.string "name"
    t.string "page_name"
    t.boolean "is_active", default: false
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name", "page_name"], name: "index_ab_tests_on_name_and_page_name"
    t.index ["page_name"], name: "index_ab_tests_on_page_name"
  end

  create_table "active_storage_attachments", charset: "utf8mb4", collation: "utf8mb4_unicode_ci", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", charset: "utf8mb4", collation: "utf8mb4_unicode_ci", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", charset: "utf8mb4", collation: "utf8mb4_unicode_ci", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "admin_action_call_infos", charset: "utf8mb4", collation: "utf8mb4_unicode_ci", force: :cascade do |t|
    t.string "controller_name", null: false
    t.string "action_name", null: false
    t.integer "call_count", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["controller_name", "action_name"], name: "index_admin_action_call_infos_on_controller_name_and_action_name", unique: true
  end

  create_table "affiliate_credits", charset: "utf8mb4", collation: "utf8mb4_unicode_ci", force: :cascade do |t|
    t.integer "oauth_application_id"
    t.integer "basis_points"
    t.integer "amount_cents"
    t.integer "affiliate_user_id"
    t.integer "seller_id"
    t.integer "purchase_id"
    t.integer "link_id"
    t.integer "affiliate_credit_success_balance_id"
    t.integer "affiliate_credit_chargeback_balance_id"
    t.integer "affiliate_credit_refund_balance_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "affiliate_id"
    t.index ["affiliate_id"], name: "index_affiliate_credits_on_affiliate_id"
    t.index ["affiliate_user_id"], name: "index_affiliate_credits_on_affiliate_user_id"
    t.index ["link_id"], name: "index_affiliate_credits_on_link_id"
    t.index ["oauth_application_id"], name: "index_affiliate_credits_on_oauth_application_id"
    t.index ["purchase_id"], name: "index_affiliate_credits_on_purchase_id"
    t.index ["seller_id"], name: "index_affiliate_credits_on_seller_id"
  end

  create_table "affiliate_partial_refunds", charset: "utf8mb4", collation: "utf8mb4_unicode_ci", force: :cascade do |t|
    t.integer "amount_cents", default: 0
    t.bigint "purchase_id", null: false
    t.integer "total_credit_cents", default: 0
    t.integer "affiliate_user_id"
    t.integer "seller_id"
    t.integer "affiliate_id"
    t.integer "balance_id"
    t.integer "affiliate_credit_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["affiliate_credit_id"], name: "index_affiliate_partial_refunds_on_affiliate_credit_id"
    t.index ["affiliate_id"], name: "index_affiliate_partial_refunds_on_affiliate_id"
    t.index ["affiliate_user_id"], name: "index_affiliate_partial_refunds_on_affiliate_user_id"
    t.index ["balance_id"], name: "index_affiliate_partial_refunds_on_balance_id"
    t.index ["purchase_id"], name: "index_affiliate_partial_refunds_on_purchase_id"
    t.index ["seller_id"], name: "index_affiliate_partial_refunds_on_seller_id"
  end

  create_table "affiliates", charset: "utf8mb4", collation: "utf8mb4_unicode_ci", force: :cascade do |t|
    t.integer "seller_id"
    t.integer "affiliate_user_id"
    t.integer "link_id"
    t.integer "affiliate_basis_points"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deleted_at"
    t.integer "flags", default: 0, null: false
    t.string "destination_url", limit: 2083
    t.index ["affiliate_user_id"], name: "index_affiliates_on_affiliate_user_id"
    t.index ["link_id"], name: "index_affiliates_on_link_id"
    t.index ["seller_id"], name: "index_affiliates_on_seller_id"
  end

  create_table "affiliates_links", charset: "utf8mb4", collation: "utf8mb4_unicode_ci", force: :cascade do |t|
    t.integer "affiliate_id"
    t.integer "link_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "flags", default: 0
    t.index ["affiliate_id"], name: "index_affiliates_links_on_affiliate_id"
    t.index ["link_id"], name: "index_affiliates_links_on_link_id"
  end

  create_table "api_sessions", charset: "utf8mb4", collation: "utf8mb4_unicode_ci", force: :cascade do |t|
    t.integer "user_id"
    t.string "token"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deleted_at"
    t.index ["token"], name: "index_api_sessions_on_token"
    t.index ["user_id"], name: "index_api_sessions_on_user_id"
  end

  create_table "asset_previews", charset: "utf8mb4", collation: "utf8mb4_unicode_ci", force: :cascade do |t|
    t.integer "link_id"
    t.string "attachment_file_name", limit: 2000
    t.string "attachment_content_type"
    t.integer "attachment_file_size"
    t.datetime "attachment_updated_at"
    t.string "guid"
    t.text "oembed"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deleted_at"
    t.text "attachment_meta"
    t.integer "position"
    t.index ["link_id"], name: "index_asset_previews_on_link_id"
  end

  create_table "assignments", charset: "utf8mb4", collation: "utf8mb4_unicode_ci", force: :cascade do |t|
    t.integer "ab_test_id"
    t.integer "test_path_id"
    t.string "browser_guid"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["browser_guid", "ab_test_id"], name: "index_assignments_on_browser_guid_and_ab_test_id", unique: true
    t.index ["test_path_id", "browser_guid"], name: "index_assignments_on_test_path_id_and_browser_guid"
  end

  create_table "audit_tasks", charset: "utf8mb4", collation: "utf8mb4_unicode_ci", force: :cascade do |t|
    t.string "name"
    t.bigint "owner_id"
    t.date "due_date"
    t.string "status"
    t.integer "recurrence_days"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["due_date"], name: "index_audit_tasks_on_due_date"
    t.index ["owner_id"], name: "index_audit_tasks_on_owner_id"
    t.index ["status"], name: "index_audit_tasks_on_status"
  end

  create_table "balance_transactions", charset: "utf8mb4", collation: "utf8mb4_unicode_ci", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.integer "merchant_account_id"
    t.integer "balance_id"
    t.integer "purchase_id"
    t.integer "dispute_id"
    t.integer "refund_id"
    t.integer "credit_id"
    t.datetime "occurred_at"
    t.string "issued_amount_currency"
    t.integer "issued_amount_gross_cents"
    t.integer "issued_amount_net_cents"
    t.string "holding_amount_currency"
    t.integer "holding_amount_gross_cents"
    t.integer "holding_amount_net_cents"
    t.index ["balance_id"], name: "index_balance_transactions_on_balance_id"
    t.index ["credit_id"], name: "index_balance_transactions_on_credit_id"
    t.index ["dispute_id"], name: "index_balance_transactions_on_dispute_id"
    t.index ["merchant_account_id"], name: "index_balance_transactions_on_merchant_account_id"
    t.index ["purchase_id"], name: "index_balance_transactions_on_purchase_id"
    t.index ["refund_id"], name: "index_balance_transactions_on_refund_id"
    t.index ["user_id"], name: "index_balance_transactions_on_user_id"
  end

  create_table "balances", charset: "utf8mb4", collation: "utf8mb4_unicode_ci", force: :cascade do |t|
    t.integer "user_id"
    t.date "date"
    t.integer "amount_cents", default: 0
    t.string "state"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "merchant_account_id", default: 1
    t.string "currency"
    t.string "holding_currency"
    t.integer "holding_amount_cents", default: 0
    t.index ["user_id"], name: "index_balances_on_user_id"
  end

  create_table "bank_accounts", charset: "utf8mb4", collation: "utf8mb4_unicode_ci", force: :cascade do |t|
    t.integer "user_id"
    t.string "bank_number"
    t.binary "account_number"
    t.string "state"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "account_number_last_four"
    t.string "account_holder_full_name"
    t.datetime "deleted_at"
    t.string "type"
    t.string "branch_code"
    t.string "account_type"
    t.string "stripe_bank_account_id"
    t.string "stripe_fingerprint"
    t.string "stripe_connect_account_id"
    t.string "country"
    t.integer "credit_card_id"
    t.index ["user_id"], name: "index_bank_accounts_on_user_id"
  end

  create_table "banks", charset: "utf8mb4", collation: "utf8mb4_unicode_ci", force: :cascade do |t|
    t.string "routing_number"
    t.string "name"
    t.index ["routing_number"], name: "index_banks_on_routing_number"
  end

  create_table "base_variants", charset: "utf8mb4", collation: "utf8mb4_unicode_ci", force: :cascade do |t|
    t.integer "variant_category_id"
    t.integer "price_difference_cents"
    t.string "name"
    t.integer "max_purchase_count"
    t.datetime "deleted_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "type"
    t.integer "link_id"
    t.string "custom_sku"
    t.integer "flags", default: 0, null: false
    t.string "description"
    t.boolean "customizable_price"
    t.integer "position_in_category"
    t.index ["link_id"], name: "index_base_variants_on_link_id"
    t.index ["variant_category_id"], name: "index_base_variants_on_variant_category_id"
  end

  create_table "base_variants_product_files", charset: "utf8mb4", collation: "utf8mb4_unicode_ci", force: :cascade do |t|
    t.integer "base_variant_id"
    t.integer "product_file_id"
    t.index ["base_variant_id"], name: "index_base_variants_product_files_on_base_variant_id"
    t.index ["product_file_id"], name: "index_base_variants_product_files_on_product_file_id"
  end

  create_table "base_variants_purchases", charset: "utf8mb4", collation: "utf8mb4_unicode_ci", force: :cascade do |t|
    t.integer "purchase_id"
    t.integer "base_variant_id"
    t.index ["base_variant_id"], name: "index_base_variants_purchases_on_base_variant_id"
    t.index ["purchase_id"], name: "index_base_variants_purchases_on_purchase_id"
  end

  create_table "bins", charset: "utf8mb4", collation: "utf8mb4_unicode_ci", force: :cascade do |t|
    t.string "card_bin"
    t.string "issuing_bank"
    t.string "card_type"
    t.string "card_level"
    t.string "iso_country_name"
    t.string "iso_country_a2"
    t.string "iso_country_a3"
    t.integer "iso_country_number"
    t.string "website"
    t.string "phone_number"
    t.string "card_brand"
    t.index ["card_bin"], name: "index_bins_on_card_bin"
  end

  create_table "blocked_browser_guids", charset: "utf8mb4", collation: "utf8mb4_unicode_ci", force: :cascade do |t|
    t.string "browser_guid"
    t.datetime "blocked_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["browser_guid"], name: "index_blocked_browser_guids_on_browser_guid"
  end

  create_table "blocked_ips", charset: "utf8mb4", collation: "utf8mb4_unicode_ci", force: :cascade do |t|
    t.string "ip_address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "banned"
    t.datetime "banned_at"
  end

  create_table "bundle_products", charset: "utf8mb4", collation: "utf8mb4_unicode_ci", force: :cascade do |t|
    t.bigint "bundle_id", null: false
    t.bigint "product_id", null: false
    t.bigint "variant_id"
    t.integer "position", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deleted_at"
    t.index ["bundle_id"], name: "index_bundle_products_on_bundle_id"
    t.index ["product_id"], name: "index_bundle_products_on_product_id"
    t.index ["variant_id"], name: "index_bundle_products_on_variant_id"
  end

  create_table "cart_products", charset: "utf8mb4", collation: "utf8mb4_unicode_ci", force: :cascade do |t|
    t.bigint "cart_id", null: false
    t.bigint "link_id", null: false
    t.integer "quantity", default: 1
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cart_id"], name: "index_cart_products_on_cart_id"
    t.index ["link_id"], name: "index_cart_products_on_link_id"
  end

  create_table "carts", charset: "utf8mb4", collation: "utf8mb4_unicode_ci", force: :cascade do |t|
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deleted_at"
    t.string "browser_guid"
    t.index ["user_id"], name: "index_carts_on_user_id"
  end

  create_table "categories", charset: "utf8mb4", collation: "utf8mb4_unicode_ci", force: :cascade do |t|
    t.string "name", limit: 100
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_categories_on_name"
  end

  create_table "collaborator_invitations", charset: "utf8mb4", collation: "utf8mb4_unicode_ci", force: :cascade do |t|
    t.bigint "collaborator_id", null: false
    t.bigint "link_id", null: false
    t.string "email", null: false
    t.string "token", null: false
    t.datetime "accepted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["collaborator_id"], name: "index_collaborator_invitations_on_collaborator_id"
    t.index ["link_id"], name: "index_collaborator_invitations_on_link_id"
    t.index ["token"], name: "index_collaborator_invitations_on_token", unique: true
  end

  create_table "comments", charset: "utf8mb4", collation: "utf8mb4_unicode_ci", force: :cascade do |t|
    t.string "commentable_type"
    t.integer "commentable_id"
    t.integer "author_id"
    t.string "author_name"
    t.text "content", size: :medium
    t.string "comment_type"
    t.text "json_data", size: :medium
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["commentable_id", "commentable_type"], name: "index_comments_on_commentable_id_and_commentable_type"
    t.index ["commentable_type", "commentable_id"], name: "index_comments_on_commentable"
  end

  create_table "communities", charset: "utf8mb4", collation: "utf8mb4_unicode_ci", force: :cascade do |t|
    t.string "resource_type", null: false
    t.bigint "resource_id", null: false
    t.bigint "seller_id", null: false
    t.datetime "deleted_at", precision: nil
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["deleted_at"], name: "idx_communities_deleted"
    t.index ["resource_type", "resource_id", "seller_id", "deleted_at"], name: "idx_communities_resource"
  end

  create_table "computed_sales_analytics_days", charset: "utf8mb4", collation: "utf8mb4_unicode_ci", force: :cascade do |t|
    t.string "key", null: false
    t.text "data", size: :medium
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["key"], name: "index_computed_sales_analytics_days_on_key", unique: true
  end

  create_table "consumption_events", charset: "utf8mb4", collation: "utf8mb4_unicode_ci", force: :cascade do |t|
    t.integer "product_file_id"
    t.integer "url_redirect_id"
    t.integer "purchase_id"
    t.string "event_type"
    t.string "platform"
    t.integer "flags", default: 0, null: false
    t.text "json_data"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "link_id"
    t.datetime "consumed_at"
    t.integer "media_location_basis_points"
    t.index ["link_id"], name: "index_consumption_events_on_link_id"
    t.index ["product_file_id"], name: "index_consumption_events_on_product_file_id"
    t.index ["purchase_id"], name: "index_consumption_events_on_purchase_id"
  end

  create_table "credit_cards", charset: "utf8mb4", collation: "utf8mb4_unicode_ci", force: :cascade do |t|
    t.string "card_type"
    t.integer "expiry_month"
    t.integer "expiry_year"
    t.string "stripe_customer_id"
    t.string "visual"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "stripe_fingerprint"
    t.boolean "cvc_check_failed"
    t.string "card_country"
    t.string "stripe_card_id"
    t.string "card_bin"
    t.integer "preorder_id"
    t.string "card_data_handling_mode"
    t.string "charge_processor_id"
    t.string "braintree_customer_id"
    t.string "funding_type"
    t.string "paypal_billing_agreement_id"
    t.index ["preorder_id"], name: "index_credit_cards_on_preorder_id"
    t.index ["stripe_fingerprint"], name: "index_credit_cards_on_stripe_fingerprint"
  end

  create_table "credits", charset: "utf8mb4", collation: "utf8mb4_unicode_ci", force: :cascade do |t|
    t.integer "user_id"
    t.integer "amount_cents"
    t.integer "balance_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "crediting_user_id"
    t.integer "chargebacked_purchase_id"
    t.integer "merchant_account_id", default: 1
    t.integer "dispute_id"
    t.integer "returned_payment_id"
    t.index ["dispute_id"], name: "index_credits_on_dispute_id"
  end

  create_table "custom_domains", charset: "utf8mb4", collation: "utf8mb4_unicode_ci", force: :cascade do |t|
    t.integer "user_id"
    t.string "domain"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "ssl_certificate_issued_at"
    t.datetime "deleted_at"
    t.bigint "product_id"
    t.index ["ssl_certificate_issued_at"], name: "index_custom_domains_on_ssl_certificate_issued_at"
    t.index ["user_id"], name: "index_custom_domains_on_user_id"
  end

  create_table "daily_metrics", charset: "utf8mb4", collation: "utf8mb4_unicode_ci", force: :cascade do |t|
    t.string "event_name"
    t.date "events_date"
    t.integer "event_count"
    t.integer "user_count"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "source_type", default: "all"
    t.index ["event_name", "events_date", "source_type"], name: "index_daily_metrics_on_event_name_events_date_and_source_type", unique: true
  end

  create_table "delayed_emails", charset: "utf8mb4", collation: "utf8mb4_unicode_ci", force: :cascade do |t|
    t.integer "purchase_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.string "email_type"
  end

  create_table "devices", charset: "utf8mb4", collation: "utf8mb4_unicode_ci", force: :cascade do |t|
    t.string "token", null: false
    t.string "app_version"
    t.string "device_type", default: "ios", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "app_type", default: "consumer", null: false
    t.index ["app_type", "user_id"], name: "index_devices_on_app_type_and_user_id"
    t.index ["user_id"], name: "index_devices_on_user_id"
  end

  create_table "disputes", charset: "utf8mb4", collation: "utf8mb4_unicode_ci", force: :cascade do |t|
    t.integer "purchase_id"
    t.string "charge_processor_id"
    t.string "charge_processor_dispute_id"
    t.string "reason"
    t.string "state"
    t.datetime "initiated_at"
    t.datetime "closed_at"
    t.datetime "formalized_at"
    t.datetime "won_at"
    t.datetime "lost_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "service_charge_id"
    t.index ["purchase_id"], name: "index_disputes_on_purchase_id"
    t.index ["service_charge_id"], name: "index_disputes_on_service_charge_id"
  end

  create_table "dropbox_files", charset: "utf8mb4", collation: "utf8mb4_unicode_ci", force: :cascade do |t|
    t.string "state"
    t.string "dropbox_url", limit: 2000
    t.datetime "expires_at"
    t.datetime "deleted_at"
    t.integer "user_id"
    t.integer "product_file_id"
    t.integer "link_id"
    t.text "json_data", size: :medium
    t.string "s3_url", limit: 2000
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["link_id"], name: "index_dropbox_files_on_link_id"
    t.index ["product_file_id"], name: "index_dropbox_files_on_product_file_id"
    t.index ["user_id"], name: "index_dropbox_files_on_user_id"
  end

  create_table "dynamic_product_page_switch_assignments", charset: "utf8mb4", collation: "utf8mb4_unicode_ci", force: :cascade do |t|
    t.integer "link_id"
    t.integer "dynamic_product_page_switch_id"
    t.integer "switch_value"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["dynamic_product_page_switch_id"], name: "idx_on_dynamic_product_page_switch_id_f538b3a450"
    t.index ["link_id", "dynamic_product_page_switch_id"], name: "index_dynamic_product_page_assignments_on_link_id_and_switch_id"
    t.index ["link_id"], name: "index_dynamic_product_page_switch_assignments_on_link_id"
  end

  create_table "dynamic_product_page_switches", charset: "utf8mb4", collation: "utf8mb4_unicode_ci", force: :cascade do |t|
    t.string "name"
    t.integer "default_switch_value"
    t.integer "flags", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "email_infos", charset: "utf8mb4", collation: "utf8mb4_unicode_ci", force: :cascade do |t|
    t.integer "purchase_id"
    t.integer "installment_id"
    t.string "type"
    t.string "email_name"
    t.string "state"
    t.datetime "sent_at"
    t.datetime "delivered_at"
    t.datetime "opened_at"
    t.index ["installment_id"], name: "index_email_infos_on_installment_id"
    t.index ["purchase_id"], name: "index_email_infos_on_purchase_id"
  end

  create_table "event_test_path_assignments", charset: "utf8mb4", collation: "utf8mb4_unicode_ci", force: :cascade do |t|
    t.integer "event_id"
    t.string "event_name"
    t.string "active_test_paths"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["active_test_paths", "event_name"], name: "index_event_assignments_on_active_test_paths_and_event_name"
    t.index ["event_id"], name: "index_event_test_path_assignments_on_event_id"
  end

  create_table "events", charset: "utf8mb4", collation: "utf8mb4_unicode_ci", force: :cascade do |t|
    t.integer "visit_id"
    t.string "ip_address"
    t.string "event_name"
    t.integer "user_id"
    t.integer "link_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "referrer"
    t.string "parent_referrer"
    t.string "language"
    t.string "browser"
    t.boolean "is_mobile", default: false
    t.string "email"
    t.integer "purchase_id"
    t.integer "price_cents"
    t.integer "credit_card_id"
    t.string "card_type"
    t.string "card_visual"
    t.string "purchase_state"
    t.string "billing_zip"
    t.boolean "chargeback", default: false
    t.boolean "refunded", default: false
    t.string "view_url"
    t.string "fingerprint"
    t.string "ip_country"
    t.float "ip_longitude"
    t.float "ip_latitude"
    t.boolean "is_modal"
    t.text "friend_actions"
    t.string "browser_fingerprint"
    t.string "browser_plugins"
    t.string "browser_guid"
    t.string "referrer_domain"
    t.string "ip_state"
    t.integer "service_charge_id"
    t.string "active_test_path_assignments"
    t.index ["browser_guid"], name: "index_events_on_browser_guid"
    t.index ["created_at"], name: "index_events_on_created_at"
    t.index ["event_name", "link_id", "created_at"], name: "index_events_on_event_name_and_link_id"
    t.index ["ip_address"], name: "index_events_on_ip_address"
    t.index ["link_id"], name: "index_events_on_link_id"
    t.index ["purchase_id"], name: "index_events_on_purchase_id"
    t.index ["service_charge_id"], name: "index_events_on_service_charge_id"
    t.index ["user_id"], name: "index_events_on_user_id"
    t.index ["visit_id"], name: "index_events_on_visit_id"
  end

  create_table "failed_purchases", charset: "utf8mb4", collation: "utf8mb4_unicode_ci", force: :cascade do |t|
    t.integer "link_id"
    t.text "email"
    t.string "ip_address"
    t.string "stripe_fingerprint"
    t.string "card_type"
    t.string "card_country"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "followers", charset: "utf8mb4", collation: "utf8mb4_unicode_ci", force: :cascade do |t|
    t.bigint "followed_id", null: false
    t.string "email"
    t.datetime "cancelled_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "follower_user_id"
    t.string "source"
    t.integer "source_product_id"
    t.datetime "confirmed_at"
    t.index ["email", "followed_id"], name: "index_followers_on_email_and_followed_id"
    t.index ["followed_id", "email"], name: "index_follows_on_followed_id_and_email"
    t.index ["followed_id", "follower_user_id"], name: "index_followers_on_followed_id_and_follower_user_id"
    t.index ["follower_user_id", "followed_id"], name: "index_followers_on_follower_user_id_and_followed_id"
  end

  create_table "friendly_id_slugs", charset: "utf8mb4", collation: "utf8mb4_unicode_ci", force: :cascade do |t|
    t.string "slug", null: false
    t.bigint "sluggable_id", null: false
    t.string "sluggable_type", limit: 50
    t.string "scope"
    t.datetime "created_at"
    t.index ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type"
    t.index ["sluggable_type", "sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_type_and_sluggable_id"
  end

  create_table "gifts", charset: "utf8mb4", collation: "utf8mb4_unicode_ci", force: :cascade do |t|
    t.integer "giftee_purchase_id"
    t.integer "gifter_purchase_id"
    t.integer "link_id"
    t.string "state"
    t.text "gift_note", size: :long
    t.string "giftee_email"
    t.string "gifter_email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["giftee_email"], name: "index_gifts_on_giftee_email"
    t.index ["giftee_purchase_id"], name: "index_gifts_on_giftee_purchase_id"
    t.index ["gifter_email"], name: "index_gifts_on_gifter_email"
  end

  create_table "import_jobs", charset: "utf8mb4", collation: "utf8mb4_unicode_ci", force: :cascade do |t|
    t.string "import_file_url"
    t.integer "user_id"
    t.integer "link_id"
    t.string "state"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "imported_customers", charset: "utf8mb4", collation: "utf8mb4_unicode_ci", force: :cascade do |t|
    t.string "email"
    t.datetime "purchase_date"
    t.integer "link_id"
    t.integer "importing_user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deleted_at"
    t.index ["email"], name: "index_imported_customers_on_email"
    t.index ["importing_user_id"], name: "index_imported_customers_on_importing_user_id"
    t.index ["link_id", "purchase_date"], name: "index_imported_customers_on_link_id_and_purchase_date"
    t.index ["link_id"], name: "index_imported_customers_on_link_id"
  end

  create_table "installment_events", charset: "utf8mb4", collation: "utf8mb4_unicode_ci", force: :cascade do |t|
    t.bigint "event_id"
    t.bigint "installment_id"
    t.index ["event_id"], name: "index_installment_events_on_event_id"
    t.index ["installment_id", "event_id"], name: "index_installment_events_on_installment_id_and_event_id", unique: true
    t.index ["installment_id"], name: "index_installment_events_on_installment_id"
  end

  create_table "installment_rules", charset: "utf8mb4", collation: "utf8mb4_unicode_ci", force: :cascade do |t|
    t.integer "installment_id"
    t.integer "delayed_delivery_time"
    t.datetime "to_be_published_at"
    t.integer "version", default: 0, null: false
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "time_period"
  end

  create_table "installments", charset: "utf8mb4", collation: "utf8mb4_unicode_ci", force: :cascade do |t|
    t.integer "link_id"
    t.text "message", size: :long
    t.text "url", size: :long
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.datetime "published_at"
    t.datetime "deleted_at"
    t.integer "flags", default: 0, null: false
    t.integer "seller_id"
    t.string "installment_type"
    t.text "json_data", size: :medium
    t.integer "customer_count"
    t.integer "workflow_id"
    t.string "call_to_action_text", limit: 2083
    t.string "call_to_action_url", limit: 2083
    t.string "cover_image_url"
    t.integer "base_variant_id"
    t.string "slug"
    t.integer "installment_events_count", default: 0
    t.index ["base_variant_id"], name: "index_installments_on_base_variant_id"
    t.index ["link_id"], name: "index_installments_on_link_id"
    t.index ["seller_id", "link_id"], name: "index_installments_on_seller_id_and_link_id"
    t.index ["workflow_id"], name: "index_installments_on_workflow_id"
  end

  create_table "integrations", charset: "utf8mb4", collation: "utf8mb4_unicode_ci", force: :cascade do |t|
    t.string "api_key", null: false
    t.string "integration_type", null: false
    t.text "json_data"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "type"
  end

  create_table "invites", charset: "utf8mb4", collation: "utf8mb4_unicode_ci", force: :cascade do |t|
    t.integer "sender_id"
    t.string "receiver_email"
    t.integer "receiver_id"
    t.string "invite_state"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["sender_id"], name: "index_invites_on_sender_id"
  end

  create_table "large_sellers", charset: "utf8mb4", collation: "utf8mb4_unicode_ci", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.integer "sales_count", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["updated_at"], name: "index_large_sellers_on_updated_at"
    t.index ["user_id"], name: "index_large_sellers_on_user_id", unique: true
  end

  create_table "legacy_permalinks", charset: "utf8mb4", collation: "utf8mb4_unicode_ci", force: :cascade do |t|
    t.string "permalink", null: false
    t.bigint "product_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["permalink"], name: "index_legacy_permalinks_on_permalink", unique: true
    t.index ["product_id"], name: "index_legacy_permalinks_on_product_id"
  end

  create_table "licenses", charset: "utf8mb4", collation: "utf8mb4_unicode_ci", force: :cascade do |t|
    t.integer "link_id"
    t.integer "purchase_id"
    t.string "serial"
    t.datetime "trial_expires_at"
    t.integer "uses", default: 0
    t.string "json_data"
    t.datetime "deleted_at"
    t.integer "flags", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "imported_customer_id"
    t.datetime "disabled_at"
    t.index ["imported_customer_id"], name: "index_licenses_on_imported_customer_id"
    t.index ["link_id"], name: "index_licenses_on_link_id"
    t.index ["purchase_id"], name: "index_licenses_on_purchase_id"
  end

  create_table "line_items", charset: "utf8mb4", collation: "utf8mb4_unicode_ci", force: :cascade do |t|
    t.bigint "cart_id"
    t.bigint "link_id"
    t.integer "quantity", default: 1
    t.integer "price_cents"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cart_id"], name: "index_line_items_on_cart_id"
    t.index ["link_id"], name: "index_line_items_on_link_id"
  end

  create_table "link_view_events", charset: "utf8mb4", collation: "utf8mb4_unicode_ci", force: :cascade do |t|
    t.integer "visit_id"
    t.string "ip_address"
    t.string "event_name"
    t.integer "user_id"
    t.integer "link_id"
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
    t.string "referrer"
    t.string "parent_referrer"
    t.string "language"
    t.string "browser"
    t.boolean "is_mobile", default: false
    t.string "email"
    t.integer "purchase_id"
    t.integer "price_cents"
    t.integer "credit_card_id"
    t.string "card_type"
    t.string "card_visual"
    t.string "purchase_state"
    t.string "billing_zip"
    t.boolean "chargeback", default: false
    t.boolean "refunded", default: false
    t.string "view_url"
    t.string "fingerprint"
    t.string "ip_country"
    t.float "ip_longitude"
    t.float "ip_latitude"
    t.boolean "is_modal"
    t.text "friend_actions"
    t.string "browser_fingerprint"
    t.string "browser_plugins"
    t.string "browser_guid"
    t.string "referrer_domain"
    t.string "ip_state"
    t.string "active_test_path_assignments"
    t.integer "service_charge_id"
  end

  create_table "links", charset: "utf8mb4", collation: "utf8mb4_unicode_ci", force: :cascade do |t|
    t.bigint "user_id"
    t.string "name"
    t.string "unique_permalink"
    t.text "url", size: :medium
    t.text "preview_url", size: :medium
    t.text "description", size: :medium
    t.integer "purchase_type", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "purchase_disabled_at"
    t.datetime "deleted_at"
    t.integer "preview_attachment_id"
    t.integer "price_cents"
    t.string "price_currency_type"
    t.boolean "customizable_price"
    t.boolean "webhook"
    t.integer "max_purchase_count"
    t.integer "webhook_fail_count", default: 0
    t.integer "bad_card_counter", default: 0
    t.boolean "require_shipping", default: false
    t.boolean "shown_on_profile", default: true
    t.string "partner_source"
    t.datetime "last_partner_sync"
    t.string "upc_code"
    t.string "isrc_code"
    t.string "preview_file_name"
    t.string "preview_content_type"
    t.integer "preview_file_size"
    t.datetime "preview_updated_at"
    t.string "preview_guid"
    t.string "attachment_file_name"
    t.string "attachment_content_type"
    t.integer "attachment_file_size"
    t.datetime "attachment_updated_at"
    t.string "attachment_guid"
    t.string "preview_meta"
    t.string "attachment_meta"
    t.integer "bad_email_counter", default: 0
    t.boolean "preview_processed", default: true
    t.text "territory_restriction", size: :medium
    t.text "variants", size: :medium
    t.text "preview_oembed", size: :medium
    t.boolean "showcaseable", default: false
    t.boolean "preview_automatically_generated"
    t.text "custom_receipt", size: :medium
    t.string "custom_filetype"
    t.string "filetype"
    t.string "filegroup"
    t.bigint "size"
    t.integer "bitrate"
    t.integer "framerate"
    t.integer "pagelength"
    t.integer "duration"
    t.integer "width"
    t.integer "height"
    t.string "custom_permalink"
    t.string "common_color"
    t.integer "suggested_price_cents"
    t.text "webhook_url", size: :medium
    t.datetime "banned_at"
    t.integer "risk_score"
    t.datetime "risk_score_updated_at"
    t.text "custom_fields", size: :medium
    t.boolean "pdf_stamp_enabled"
    t.boolean "draft", default: false
    t.boolean "is_charitable", default: false
    t.integer "flags", default: 0, null: false
    t.string "custom_download_text"
    t.integer "subscription_duration"
    t.text "json_data", size: :medium
    t.string "external_mapping_id"
    t.integer "affiliate_application_id"
    t.integer "rental_price_cents"
    t.integer "duration_in_months"
    t.datetime "migrated_to_tiered_pricing_at", precision: nil
    t.integer "free_trial_duration_unit"
    t.integer "free_trial_duration_amount"
    t.string "native_type"
    t.integer "discover_fee_per_thousand", default: 100
    t.bigint "taxonomy_id"
    t.datetime "content_updated_at"
    t.string "support_email"
    t.index ["banned_at"], name: "index_links_on_banned_at"
    t.index ["custom_permalink"], name: "index_links_on_custom_permalink"
    t.index ["deleted_at"], name: "index_links_on_deleted_at"
    t.index ["purchase_disabled_at"], name: "index_links_on_purchase_disabled_at"
    t.index ["showcaseable"], name: "index_links_on_showcaseable"
    t.index ["shown_on_profile"], name: "index_links_on_shown_on_profile"
    t.index ["taxonomy_id"], name: "index_links_on_taxonomy_id"
    t.index ["unique_permalink"], name: "index_links_on_unique_permalink"
    t.index ["user_id"], name: "index_links_on_user_id"
  end

  create_table "megaphone_states", charset: "utf8mb4", collation: "utf8mb4_unicode_ci", force: :cascade do |t|
    t.integer "user_id"
    t.bigint "flags", default: 0, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "merchant_accounts", charset: "utf8mb4", collation: "utf8mb4_unicode_ci", force: :cascade do |t|
    t.integer "user_id"
    t.string "acquirer_id"
    t.string "acquirer_merchant_id"
    t.string "charge_processor_id"
    t.string "charge_processor_merchant_id"
    t.text "json_data"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deleted_at"
    t.string "relationship"
    t.datetime "charge_processor_verified_at"
    t.string "country"
    t.string "currency"
    t.datetime "charge_processor_deleted_at"
    t.datetime "charge_processor_alive_at"
    t.index ["user_id"], name: "index_merchant_accounts_on_user_id"
  end

  create_table "messages", charset: "utf8mb4", collation: "utf8mb4_unicode_ci", force: :cascade do |t|
    t.integer "parent_id"
    t.integer "purchase_id"
    t.integer "flags", default: 0, null: false
    t.string "state"
    t.text "text"
    t.string "title"
    t.datetime "read_at"
    t.datetime "responded_at"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["parent_id"], name: "index_messages_on_parent_id"
    t.index ["purchase_id"], name: "index_messages_on_purchase_id"
  end

  create_table "oauth_access_grants", charset: "utf8mb4", collation: "utf8mb4_unicode_ci", force: :cascade do |t|
    t.bigint "resource_owner_id", null: false
    t.bigint "application_id", null: false
    t.string "token"
    t.integer "expires_in", null: false
    t.string "redirect_uri"
    t.datetime "created_at", null: false
    t.datetime "revoked_at"
    t.string "scopes"
    t.index ["created_at"], name: "index_oauth_access_grants_on_created_at"
  end

  create_table "oauth_access_tokens", charset: "utf8mb4", collation: "utf8mb4_unicode_ci", force: :cascade do |t|
    t.bigint "resource_owner_id"
    t.bigint "application_id", null: false
    t.string "token"
    t.string "refresh_token"
    t.integer "expires_in"
    t.datetime "revoked_at"
    t.datetime "created_at", null: false
    t.string "scopes"
    t.index ["resource_owner_id"], name: "index_oauth_access_tokens_on_resource_owner_id"
  end

  create_table "oauth_applications", charset: "utf8mb4", collation: "utf8mb4_unicode_ci", force: :cascade do |t|
    t.string "name"
    t.string "uid"
    t.string "secret"
    t.string "redirect_uri"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "owner_id"
    t.string "owner_type"
    t.string "icon_file_name"
    t.string "icon_content_type"
    t.integer "icon_file_size"
    t.datetime "icon_updated_at"
    t.string "icon_guid"
    t.integer "affiliate_basis_points"
    t.datetime "deleted_at"
    t.string "scopes"
    t.boolean "confidential", default: false, null: false
    t.index ["owner_id", "owner_type"], name: "index_oauth_applications_on_owner_id_and_owner_type"
  end

  create_table "offer_codes", charset: "utf8mb4", collation: "utf8mb4_unicode_ci", force: :cascade do |t|
    t.integer "link_id"
    t.string "name"
    t.integer "amount_cents"
    t.integer "max_purchase_count"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "amount_percentage"
    t.integer "user_id", null: false
    t.string "currency_type"
    t.bigint "flags", default: 0
    t.index ["link_id"], name: "index_offer_codes_on_link_id"
    t.index ["name", "link_id"], name: "index_offer_codes_on_name_and_link_id"
    t.index ["user_id"], name: "index_offer_codes_on_user_id"
  end

  create_table "offer_codes_products", charset: "utf8mb4", collation: "utf8mb4_unicode_ci", force: :cascade do |t|
    t.bigint "offer_code_id", null: false
    t.bigint "product_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["offer_code_id"], name: "index_offer_codes_products_on_offer_code_id"
    t.index ["product_id"], name: "index_offer_codes_products_on_product_id"
  end

  create_table "parents_children", id: false, charset: "utf8mb4", collation: "utf8mb4_unicode_ci", force: :cascade do |t|
    t.integer "parent_id"
    t.integer "child_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["child_id"], name: "index_parents_children_on_child_id"
    t.index ["parent_id"], name: "index_parents_children_on_parent_id"
  end

  create_table "payment_options", charset: "utf8mb4", collation: "utf8mb4_unicode_ci", force: :cascade do |t|
    t.integer "subscription_id"
    t.integer "price_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deleted_at"
    t.integer "flags", default: 0, null: false
    t.index ["price_id"], name: "index_payment_options_on_price_id"
    t.index ["subscription_id"], name: "index_payment_options_on_subscription_id"
  end

  create_table "payments", charset: "utf8mb4", collation: "utf8mb4_unicode_ci", force: :cascade do |t|
    t.integer "user_id"
    t.string "state"
    t.text "status_data"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "txn_id"
    t.string "unique_id"
    t.integer "processor_fee_cents"
    t.string "correlation_id"
    t.string "processor"
    t.integer "amount_cents"
    t.string "payment_address"
    t.date "payout_period_end_date"
    t.integer "bank_account_id"
    t.integer "amount_cents_in_local_currency"
    t.string "stripe_connect_account_id"
    t.string "stripe_transfer_id"
    t.string "stripe_internal_transfer_id"
    t.string "local_currency"
    t.string "currency"
    t.integer "flags", default: 0, null: false
    t.text "json_data"
    t.string "failure_reason"
    t.index ["user_id"], name: "index_payments_on_user_id"
  end

  create_table "payments_balances", charset: "utf8mb4", collation: "utf8mb4_unicode_ci", force: :cascade do |t|
    t.integer "payment_id"
    t.integer "balance_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["balance_id"], name: "index_payments_balances_on_balance_id"
    t.index ["payment_id"], name: "index_payments_balances_on_payment_id"
  end

  create_table "preorder_links", charset: "utf8mb4", collation: "utf8mb4_unicode_ci", force: :cascade do |t|
    t.integer "link_id"
    t.string "state"
    t.datetime "release_at"
    t.string "url"
    t.string "attachment_guid"
    t.string "custom_filetype"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["link_id"], name: "index_preorder_links_on_link_id"
  end

  create_table "preorders", charset: "utf8mb4", collation: "utf8mb4_unicode_ci", force: :cascade do |t|
    t.bigint "preorder_link_id", null: false
    t.bigint "seller_id", null: false
    t.integer "purchaser_id"
    t.string "state"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["preorder_link_id"], name: "index_preorders_on_preorder_link_id"
    t.index ["purchaser_id"], name: "index_preorders_on_purchaser_id"
    t.index ["seller_id"], name: "index_preorders_on_seller_id"
  end

  create_table "prices", charset: "utf8mb4", collation: "utf8mb4_unicode_ci", force: :cascade do |t|
    t.integer "link_id"
    t.integer "price_cents", default: 0, null: false
    t.string "currency"
    t.string "recurrence"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deleted_at"
    t.integer "flags", default: 0, null: false
    t.integer "variant_id"
    t.integer "suggested_price_cents"
    t.datetime "archived_at", precision: nil
    t.boolean "base_tier_price"
    t.index ["link_id"], name: "index_prices_on_link_id"
    t.index ["variant_id"], name: "index_prices_on_variant_id"
  end

  create_table "processed_audios", charset: "utf8mb4", collation: "utf8mb4_unicode_ci", force: :cascade do |t|
    t.integer "product_file_id"
    t.string "url", limit: 1024
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deleted_at"
    t.index ["product_file_id"], name: "index_processed_audios_on_product_file_id"
  end

  create_table "product_cached_values", charset: "utf8mb4", collation: "utf8mb4_unicode_ci", force: :cascade do |t|
    t.bigint "product_id", null: false
    t.boolean "expired", default: false, null: false
    t.integer "successful_sales_count"
    t.integer "remaining_for_sale_count"
    t.decimal "monthly_recurring_revenue", precision: 10, scale: 2
    t.decimal "revenue_pending", precision: 10, scale: 2
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "total_usd_cents", default: 0
    t.index ["expired"], name: "index_product_cached_values_on_expired"
    t.index ["product_id"], name: "index_product_cached_values_on_product_id"
  end

  create_table "product_categorizations", charset: "utf8mb4", collation: "utf8mb4_unicode_ci", force: :cascade do |t|
    t.integer "category_id"
    t.integer "product_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_product_categorizations_on_category_id"
    t.index ["product_id"], name: "index_product_categorizations_on_product_id"
  end

  create_table "product_files", charset: "utf8mb4", collation: "utf8mb4_unicode_ci", force: :cascade do |t|
    t.integer "link_id"
    t.string "url", limit: 1024
    t.string "filetype"
    t.string "filegroup"
    t.bigint "size"
    t.integer "bitrate"
    t.integer "framerate"
    t.integer "pagelength"
    t.integer "duration"
    t.integer "width"
    t.integer "height"
    t.integer "flags", default: 0, null: false
    t.text "json_data", size: :long
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "position"
    t.integer "installment_id"
    t.string "display_name", limit: 1024
    t.datetime "deleted_from_cdn_at"
    t.index ["deleted_from_cdn_at"], name: "index_product_files_on_deleted_from_cdn_at"
    t.index ["installment_id"], name: "index_product_files_on_installment_id"
    t.index ["link_id"], name: "index_product_files_on_link_id"
  end

  create_table "product_files_archives", charset: "utf8mb4", collation: "utf8mb4_unicode_ci", force: :cascade do |t|
    t.datetime "deleted_at"
    t.bigint "link_id"
    t.bigint "installment_id"
    t.string "product_files_archive_state"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "url", limit: 1024
    t.datetime "deleted_from_cdn_at"
    t.bigint "variant_id"
    t.index ["deleted_from_cdn_at"], name: "index_product_files_archives_on_deleted_from_cdn_at"
    t.index ["installment_id"], name: "index_product_files_archives_on_installment_id"
    t.index ["link_id"], name: "index_product_files_archives_on_link_id"
    t.index ["variant_id"], name: "index_product_files_archives_on_variant_id"
  end

  create_table "product_files_files_archives", charset: "utf8mb4", collation: "utf8mb4_unicode_ci", force: :cascade do |t|
    t.integer "product_file_id"
    t.integer "product_files_archive_id"
    t.index ["product_file_id"], name: "index_product_files_files_archives_on_product_file_id"
    t.index ["product_files_archive_id"], name: "index_product_files_files_archives_on_product_files_archive_id"
  end

  create_table "product_installment_plans", charset: "utf8mb4", collation: "utf8mb4_unicode_ci", force: :cascade do |t|
    t.bigint "link_id", null: false
    t.integer "number_of_installments", null: false
    t.string "recurrence", default: "monthly", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deleted_at"
    t.index ["link_id"], name: "index_product_installment_plans_on_link_id"
  end

  create_table "product_integrations", charset: "utf8mb4", collation: "utf8mb4_unicode_ci", force: :cascade do |t|
    t.bigint "product_id", null: false
    t.bigint "integration_id", null: false
    t.datetime "deleted_at", precision: nil
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["integration_id"], name: "index_product_integrations_on_integration_id"
    t.index ["product_id"], name: "index_product_integrations_on_product_id"
  end

  create_table "product_review_stats", charset: "utf8mb4", collation: "utf8mb4_unicode_ci", force: :cascade do |t|
    t.integer "link_id"
    t.integer "reviews_count", default: 0, null: false
    t.float "average_rating", default: 0.0, null: false
    t.integer "ratings_of_one_count", default: 0
    t.integer "ratings_of_two_count", default: 0
    t.integer "ratings_of_three_count", default: 0
    t.integer "ratings_of_four_count", default: 0
    t.integer "ratings_of_five_count", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["link_id"], name: "index_product_review_stats_on_link_id", unique: true
  end

  create_table "product_reviews", charset: "utf8mb4", collation: "utf8mb4_unicode_ci", force: :cascade do |t|
    t.integer "purchase_id"
    t.integer "rating"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "link_id"
  end

  create_table "product_taggings", charset: "utf8mb4", collation: "utf8mb4_unicode_ci", force: :cascade do |t|
    t.integer "tag_id"
    t.integer "product_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_product_taggings_on_product_id"
    t.index ["tag_id"], name: "index_product_taggings_on_tag_id"
  end

  create_table "profile_tags", charset: "utf8mb4", collation: "utf8mb4_unicode_ci", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "tag_id", null: false
    t.boolean "active", default: true, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["tag_id"], name: "index_profile_tags_on_tag_id"
    t.index ["user_id"], name: "index_profile_tags_on_user_id"
  end

  create_table "public_files", charset: "utf8mb4", collation: "utf8mb4_unicode_ci", force: :cascade do |t|
    t.bigint "seller_id"
    t.bigint "resource_id", null: false
    t.string "resource_type", null: false
    t.string "public_id", null: false
    t.string "original_file_name", null: false
    t.string "display_name", null: false
    t.string "file_type"
    t.string "file_group"
    t.datetime "scheduled_for_deletion_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deleted_at"
    t.index ["public_id"], name: "index_public_files_on_public_id", unique: true
    t.index ["resource_type", "resource_id"], name: "index_public_files_on_resource_type_and_resource_id"
    t.index ["seller_id"], name: "index_public_files_on_seller_id"
  end

  create_table "purchase_codes", charset: "utf8mb3", force: :cascade do |t|
    t.string "token"
    t.datetime "used_at"
    t.datetime "expires_at"
    t.integer "url_redirect_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "subscription_id"
    t.integer "purchase_id"
    t.index ["purchase_id"], name: "index_purchase_codes_on_purchase_id"
    t.index ["subscription_id"], name: "index_purchase_codes_on_subscription_id"
    t.index ["token"], name: "index_purchase_codes_on_token"
    t.index ["url_redirect_id"], name: "index_purchase_codes_on_url_redirect_id"
  end

  create_table "purchase_sales_tax_infos", charset: "utf8mb4", collation: "utf8mb4_unicode_ci", force: :cascade do |t|
    t.integer "purchase_id"
    t.string "elected_country_code"
    t.string "card_country_code"
    t.string "ip_country_code"
    t.string "country_code"
    t.string "postal_code"
    t.string "ip_address"
    t.string "business_vat_id"
    t.index ["purchase_id"], name: "index_purchase_sales_tax_infos_on_purchase_id"
  end

  create_table "purchases", charset: "utf8mb4", collation: "utf8mb4_unicode_ci", force: :cascade do |t|
    t.integer "seller_id"
    t.datetime "created_at"
    t.datetime "updated_at", null: false
    t.integer "fee_cents"
    t.integer "link_id"
    t.text "email"
    t.integer "price_cents"
    t.integer "displayed_price_cents"
    t.string "displayed_price_currency_type"
    t.string "rate_converted_to_usd"
    t.integer "credit_card_id"
    t.string "purchaser_type"
    t.integer "purchaser_id"
    t.string "street_address"
    t.string "city"
    t.string "state"
    t.string "zip_code"
    t.string "country"
    t.string "full_name"
    t.string "session_id"
    t.boolean "stripe_refunded"
    t.string "stripe_transaction_id"
    t.string "stripe_fingerprint"
    t.string "stripe_card_id"
    t.string "ip_address"
    t.boolean "is_mobile"
    t.boolean "can_contact", default: true
    t.string "subunsub"
    t.text "variants"
    t.string "referrer"
    t.string "stripe_status"
    t.datetime "chargeback_date"
    t.boolean "webhook_failed", default: false
    t.boolean "failed", default: false
    t.boolean "in_progress", default: false
    t.integer "purchase_number"
    t.string "card_type"
    t.string "card_visual"
    t.string "purchase_state"
    t.integer "processor_fee_cents"
    t.datetime "succeeded_at"
    t.string "card_country"
    t.string "stripe_error_code"
    t.string "browser_guid"
    t.string "error_code"
    t.integer "purchase_success_balance_id"
    t.integer "purchase_chargeback_balance_id"
    t.integer "purchase_refund_balance_id"
    t.string "card_bin"
    t.text "custom_fields"
    t.string "ip_country"
    t.string "ip_state"
    t.string "billing_name"
    t.string "billing_zip_code"
    t.integer "follow_up_count"
    t.integer "parent_id"
    t.integer "flags", default: 0, null: false
    t.integer "offer_code_id"
    t.integer "subscription_id"
    t.integer "preorder_id"
    t.integer "card_expiry_month"
    t.integer "card_expiry_year"
    t.integer "tax_cents", default: 0
    t.integer "affiliate_credit_cents", default: 0
    t.string "credit_card_zipcode"
    t.string "json_data"
    t.string "card_data_handling_mode"
    t.string "charge_processor_id"
    t.integer "total_transaction_cents"
    t.integer "gumroad_tax_cents"
    t.integer "zip_tax_rate_id"
    t.integer "quantity", default: 1, null: false
    t.integer "merchant_account_id"
    t.integer "shipping_cents", default: 0
    t.integer "affiliate_id"
    t.string "processor_fee_cents_currency"
    t.boolean "stripe_partially_refunded", default: false
    t.string "paypal_order_id"
    t.boolean "rental_expired"
    t.index ["browser_guid"], name: "index_purchases_on_browser_guid"
    t.index ["card_type", "card_visual", "created_at", "stripe_fingerprint"], name: "index_purchases_on_card_type_visual_date_fingerprint"
    t.index ["card_type", "card_visual", "stripe_fingerprint"], name: "index_purchases_on_card_type_visual_fingerprint"
    t.index ["created_at"], name: "index_purchases_on_created_at"
    t.index ["credit_card_id"], name: "index_purchases_on_credit_card_id"
    t.index ["email"], name: "index_purchases_on_email_long", length: 191
    t.index ["full_name"], name: "index_purchases_on_full_name"
    t.index ["ip_address"], name: "index_purchases_on_ip_address"
    t.index ["link_id", "purchase_state", "created_at"], name: "index_purchases_on_link_id_and_purchase_state_and_created_at"
    t.index ["link_id"], name: "index_purchases_on_link_id"
    t.index ["offer_code_id"], name: "index_purchases_on_offer_code_id"
    t.index ["paypal_order_id"], name: "index_purchases_on_paypal_order_id"
    t.index ["preorder_id"], name: "index_purchases_on_preorder_id"
    t.index ["purchase_chargeback_balance_id"], name: "index_purchase_chargeback_balance_id"
    t.index ["purchase_refund_balance_id"], name: "index_purchase_refund_balance_id"
    t.index ["purchase_success_balance_id"], name: "index_purchase_success_balance_id"
    t.index ["purchaser_id"], name: "index_purchases_on_purchaser_id"
    t.index ["purchaser_type", "purchaser_id"], name: "index_purchases_on_purchaser"
    t.index ["rental_expired"], name: "index_purchases_on_rental_expired"
    t.index ["seller_id", "purchase_state", "created_at"], name: "index_purchases_on_seller_id_and_purchase_state_and_created_at"
    t.index ["seller_id", "purchase_state", "flags", "email"], name: "index_purchases_on_seller_id_and_state_and_flags_and_email", length: { email: 191 }
    t.index ["seller_id"], name: "index_purchases_on_seller_id"
    t.index ["stripe_fingerprint"], name: "index_purchases_on_stripe_fingerprint"
    t.index ["stripe_transaction_id"], name: "index_purchases_on_stripe_transaction_id"
    t.index ["subscription_id"], name: "index_purchases_on_subscription_id"
    t.index ["zip_tax_rate_id"], name: "index_purchases_on_zip_tax_rate_id"
  end

  create_table "recommended_purchase_infos", charset: "utf8mb4", collation: "utf8mb4_unicode_ci", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "purchase_id"
    t.integer "recommended_link_id"
    t.integer "recommended_by_link_id"
    t.string "recommendation_type"
    t.integer "flags", default: 0, null: false
    t.index ["purchase_id"], name: "index_recommended_purchase_infos_on_purchase_id"
    t.index ["recommended_by_link_id"], name: "index_recommended_purchase_infos_on_recommended_by_link_id"
    t.index ["recommended_link_id"], name: "index_recommended_purchase_infos_on_recommended_link_id"
  end

  create_table "recurring_services", charset: "utf8mb4", collation: "utf8mb4_unicode_ci", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.string "type"
    t.integer "price_cents"
    t.integer "recurrence"
    t.datetime "failed_at"
    t.datetime "cancelled_at"
    t.string "state"
    t.string "json_data"
    t.index ["user_id"], name: "index_recurring_services_on_user_id"
  end

  create_table "refund_policies", charset: "utf8mb4", collation: "utf8mb4_unicode_ci", force: :cascade do |t|
    t.bigint "seller_id", null: false
    t.bigint "product_id"
    t.string "title", null: false
    t.text "fine_print"
    t.string "type"
    t.integer "max_refund_period_in_days"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_refund_policies_on_product_id", unique: true
    t.index ["seller_id"], name: "index_refund_policies_on_seller_id"
  end

  create_table "refunds", charset: "utf8mb4", collation: "utf8mb4_unicode_ci", force: :cascade do |t|
    t.integer "amount_cents", default: 0
    t.integer "purchase_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "refunding_user_id"
    t.integer "creator_tax_cents"
    t.integer "gumroad_tax_cents"
    t.integer "total_transaction_cents"
    t.text "json_data", size: :medium
    t.integer "link_id"
    t.string "status", default: "succeeded"
    t.string "processor_refund_id"
    t.integer "fee_cents"
    t.index ["link_id"], name: "index_refunds_on_link_id"
    t.index ["purchase_id"], name: "index_refunds_on_purchase_id"
  end

  create_table "resource_subscriptions", charset: "utf8mb4", collation: "utf8mb4_unicode_ci", force: :cascade do |t|
    t.bigint "oauth_application_id", null: false
    t.bigint "user_id", null: false
    t.string "resource_name"
    t.string "post_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deleted_at"
    t.index ["oauth_application_id"], name: "index_resource_subscriptions_on_oauth_application_id"
    t.index ["user_id"], name: "index_resource_subscriptions_on_user_id"
  end

  create_table "rich_contents", charset: "utf8mb4", collation: "utf8mb4_unicode_ci", force: :cascade do |t|
    t.string "contentable_type", null: false
    t.bigint "contentable_id", null: false
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deleted_at", precision: nil
    t.bigint "entity_id"
    t.string "entity_type"
    t.index ["contentable_type", "contentable_id"], name: "index_rich_contents_on_contentable"
  end

  create_table "seller_profile_sections", charset: "utf8mb4", collation: "utf8mb4_unicode_ci", force: :cascade do |t|
    t.bigint "seller_id", null: false
    t.string "header"
    t.text "shown_products", null: false
    t.boolean "show_filters", null: false
    t.string "default_product_sort", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "flags", default: 0, null: false
    t.text "json_data"
    t.bigint "product_id"
    t.index ["product_id"], name: "index_seller_profile_sections_on_product_id"
    t.index ["seller_id"], name: "index_seller_profile_sections_on_seller_id"
  end

  create_table "seller_profiles", charset: "utf8mb4", collation: "utf8mb4_unicode_ci", force: :cascade do |t|
    t.bigint "seller_id", null: false
    t.string "highlight_color"
    t.string "background_color"
    t.string "font"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.json "json_data"
    t.index ["seller_id"], name: "index_seller_profiles_on_seller_id"
  end

  create_table "sent_email_infos", charset: "utf8mb4", collation: "utf8mb4_unicode_ci", force: :cascade do |t|
    t.string "key", limit: 40, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["created_at"], name: "index_sent_email_infos_on_created_at"
    t.index ["key"], name: "index_sent_email_infos_on_key", unique: true
  end

  create_table "service_charges", charset: "utf8mb4", collation: "utf8mb4_unicode_ci", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.integer "recurring_service_id"
    t.integer "charge_cents"
    t.string "charge_cents_currency", default: "usd"
    t.string "state"
    t.datetime "succeeded_at"
    t.integer "credit_card_id"
    t.integer "card_expiry_month"
    t.integer "card_expiry_year"
    t.string "card_data_handling_mode"
    t.string "card_bin"
    t.string "card_type"
    t.string "card_country"
    t.string "card_zip_code"
    t.string "card_visual"
    t.string "charge_processor_id"
    t.integer "charge_processor_fee_cents"
    t.string "charge_processor_fee_cents_currency", default: "usd"
    t.string "charge_processor_transaction_id"
    t.string "charge_processor_fingerprint"
    t.string "charge_processor_card_id"
    t.string "charge_processor_status"
    t.string "charge_processor_error_code"
    t.boolean "charge_processor_refunded", default: false, null: false
    t.datetime "chargeback_date"
    t.string "json_data"
    t.string "error_code"
    t.integer "merchant_account_id"
    t.string "browser_guid"
    t.string "ip_address"
    t.string "ip_country"
    t.string "ip_state"
    t.string "session_id"
    t.integer "flags", default: 0, null: false
    t.string "discount_code", limit: 100
    t.index ["card_type", "card_visual", "charge_processor_fingerprint"], name: "index_service_charges_on_card_type_visual_fingerprint"
    t.index ["card_type", "card_visual", "created_at", "charge_processor_fingerprint"], name: "index_service_charges_on_card_type_visual_date_fingerprint"
    t.index ["created_at"], name: "index_service_charges_on_created_at"
    t.index ["credit_card_id"], name: "index_service_charges_on_credit_card_id"
    t.index ["merchant_account_id"], name: "index_service_charges_on_merchant_account_id"
    t.index ["recurring_service_id"], name: "index_service_charges_on_recurring_service_id"
    t.index ["user_id"], name: "index_service_charges_on_user_id"
  end

  create_table "shipments", charset: "utf8mb4", collation: "utf8mb4_unicode_ci", force: :cascade do |t|
    t.integer "purchase_id"
    t.string "ship_state"
    t.datetime "shipped_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "tracking_number"
    t.string "carrier"
    t.string "tracking_url", limit: 2083
    t.index ["purchase_id"], name: "index_shipments_on_purchase_id"
  end

  create_table "shipping_destinations", charset: "utf8mb4", collation: "utf8mb4_unicode_ci", force: :cascade do |t|
    t.integer "link_id"
    t.integer "user_id"
    t.string "country_code"
    t.integer "one_item_rate_cents", null: false
    t.integer "multiple_items_rate_cents", null: false
    t.integer "flags", default: 0, null: false
    t.text "json_data", size: :medium
    t.datetime "deleted_at"
    t.index ["link_id"], name: "index_shipping_destinations_on_link_id"
    t.index ["user_id"], name: "index_shipping_destinations_on_user_id"
  end

  create_table "skus_variants", charset: "utf8mb4", collation: "utf8mb4_unicode_ci", force: :cascade do |t|
    t.integer "variant_id"
    t.integer "sku_id"
    t.index ["sku_id"], name: "index_skus_variants_on_sku_id"
    t.index ["variant_id"], name: "index_skus_variants_on_variant_id"
  end

  create_table "stamped_pdfs", charset: "utf8mb4", collation: "utf8mb4_unicode_ci", force: :cascade do |t|
    t.integer "url_redirect_id"
    t.integer "product_file_id"
    t.string "url", limit: 1024
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_file_id"], name: "index_stamped_pdfs_on_product_file_id"
    t.index ["url_redirect_id"], name: "index_stamped_pdfs_on_url_redirect_id"
  end

  create_table "subscription_plan_changes", charset: "utf8mb4", collation: "utf8mb4_unicode_ci", force: :cascade do |t|
    t.bigint "subscription_id", null: false
    t.bigint "base_variant_id", null: false
    t.string "recurrence", null: false
    t.integer "perceived_price_cents", null: false
    t.datetime "applied_at", precision: nil
    t.datetime "deleted_at", precision: nil
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["base_variant_id"], name: "index_subscription_plan_changes_on_base_variant_id"
    t.index ["subscription_id"], name: "index_subscription_plan_changes_on_subscription_id"
  end

  create_table "subscriptions", charset: "utf8mb4", collation: "utf8mb4_unicode_ci", force: :cascade do |t|
    t.integer "link_id"
    t.integer "user_id"
    t.datetime "cancelled_at"
    t.datetime "failed_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "purchase_id"
    t.integer "flags", default: 0, null: false
    t.datetime "user_requested_cancellation_at"
    t.integer "charge_occurrence_count"
    t.datetime "ended_at"
    t.integer "last_payment_option_id"
    t.integer "credit_card_id"
    t.datetime "deactivated_at"
    t.index ["cancelled_at"], name: "index_subscriptions_on_cancelled_at"
    t.index ["deactivated_at"], name: "index_subscriptions_on_deactivated_at"
    t.index ["ended_at"], name: "index_subscriptions_on_ended_at"
    t.index ["failed_at"], name: "index_subscriptions_on_failed_at"
    t.index ["link_id", "flags"], name: "index_subscriptions_on_link_id_and_flags"
    t.index ["link_id"], name: "index_subscriptions_on_link_id"
    t.index ["user_id"], name: "index_subscriptions_on_user_id"
  end

  create_table "subtitle_files", charset: "utf8mb4", collation: "utf8mb4_unicode_ci", force: :cascade do |t|
    t.string "url", limit: 1024
    t.string "language"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "product_file_id"
    t.datetime "deleted_at"
    t.integer "size"
    t.index ["product_file_id"], name: "index_subtitle_files_on_product_file_id"
  end

  create_table "sxsw_meetings", charset: "utf8mb4", collation: "utf8mb4_unicode_ci", force: :cascade do |t|
    t.string "email"
    t.string "name"
    t.integer "time_slot"
    t.boolean "confirmed"
    t.text "message"
    t.string "guest_name"
    t.string "guest_email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tags", charset: "utf8mb4", collation: "utf8mb4_unicode_ci", force: :cascade do |t|
    t.string "name", limit: 100
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "humanized_name", limit: 100
    t.datetime "flagged_at"
    t.index ["name"], name: "index_tags_on_name"
  end

  create_table "taxonomies", charset: "utf8mb4", collation: "utf8mb4_unicode_ci", force: :cascade do |t|
    t.string "slug", null: false
    t.string "name", null: false
    t.integer "parent_id"
    t.integer "position"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["parent_id"], name: "index_taxonomies_on_parent_id"
    t.index ["slug", "parent_id"], name: "index_taxonomies_on_slug_and_parent_id", unique: true
  end

  create_table "taxonomy_hierarchies", id: false, charset: "utf8mb4", collation: "utf8mb4_unicode_ci", force: :cascade do |t|
    t.bigint "ancestor_id", null: false
    t.bigint "descendant_id", null: false
    t.integer "generations", null: false
    t.index ["ancestor_id", "descendant_id", "generations"], name: "taxonomy_anc_desc_idx", unique: true
    t.index ["descendant_id"], name: "taxonomy_desc_idx"
  end

  create_table "taxonomy_stats", charset: "utf8mb4", collation: "utf8mb4_unicode_ci", force: :cascade do |t|
    t.bigint "taxonomy_id", null: false
    t.integer "creators_count", default: 0, null: false
    t.integer "products_count", default: 0, null: false
    t.integer "sales_count", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "recent_sales_count", default: 0
    t.index ["taxonomy_id"], name: "index_taxonomy_stats_on_taxonomy_id"
  end

  create_table "team_memberships", charset: "utf8mb4", collation: "utf8mb4_unicode_ci", force: :cascade do |t|
    t.bigint "seller_id", null: false
    t.bigint "user_id", null: false
    t.string "role", null: false
    t.datetime "last_accessed_at", precision: nil
    t.datetime "deleted_at", precision: nil
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["seller_id"], name: "index_team_memberships_on_seller_id"
    t.index ["user_id"], name: "index_team_memberships_on_user_id"
  end

  create_table "test_paths", charset: "utf8mb4", collation: "utf8mb4_unicode_ci", force: :cascade do |t|
    t.string "alternative_name"
    t.integer "ab_test_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["ab_test_id", "alternative_name"], name: "index_assignments_on_ab_test_id_and_alternative_name"
    t.index ["alternative_name"], name: "index_assignments_on_alternative_name"
  end

  create_table "third_party_analytics", charset: "utf8mb4", collation: "utf8mb4_unicode_ci", force: :cascade do |t|
    t.integer "user_id"
    t.integer "link_id"
    t.text "analytics_code"
    t.string "location", default: "all"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["link_id"], name: "index_third_party_analytics_on_link_id"
    t.index ["user_id"], name: "index_third_party_analytics_on_user_id"
  end

  create_table "thumbnails", charset: "utf8mb4", collation: "utf8mb4_unicode_ci", force: :cascade do |t|
    t.bigint "product_id", null: false
    t.string "url", null: false
    t.string "status", default: "pending"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_thumbnails_on_product_id"
    t.index ["status"], name: "index_thumbnails_on_status"
  end

  create_table "tos_agreements", charset: "utf8mb4", collation: "utf8mb4_unicode_ci", force: :cascade do |t|
    t.integer "user_id"
    t.string "ip"
    t.datetime "created_at"
    t.index ["user_id"], name: "index_tos_agreements_on_user_id"
  end

  create_table "transcoded_videos", charset: "utf8mb4", collation: "utf8mb4_unicode_ci", force: :cascade do |t|
    t.integer "link_id"
    t.string "original_video_key"
    t.string "transcoded_video_key"
    t.string "transcoder_preset_key"
    t.string "job_id"
    t.string "state"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "product_file_id"
    t.integer "flags", default: 0, null: false
    t.datetime "deleted_from_cdn_at"
    t.index ["deleted_from_cdn_at"], name: "index_transcoded_videos_on_deleted_from_cdn_at"
    t.index ["job_id"], name: "index_transcoded_videos_on_job_id"
    t.index ["link_id"], name: "index_transcoded_videos_on_link_id"
    t.index ["product_file_id"], name: "index_transcoded_videos_on_product_file_id"
  end

  create_table "twitter_merchants", charset: "utf8mb4", collation: "utf8mb4_unicode_ci", force: :cascade do |t|
    t.bigint "user_id"
    t.string "email"
    t.string "name"
    t.string "support_email"
    t.string "domains"
    t.string "twitter_assigned_merchant_id"
    t.integer "flags", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["twitter_assigned_merchant_id"], name: "index_twitter_merchants_on_twitter_assigned_merchant_id"
    t.index ["user_id"], name: "index_twitter_merchants_on_user_id"
  end

  create_table "twitter_orders", charset: "utf8mb4", collation: "utf8mb4_unicode_ci", force: :cascade do |t|
    t.bigint "purchase_id"
    t.string "twitter_order_id"
    t.bigint "order_timestamp"
    t.string "stripe_transaction_id"
    t.integer "charge_amount_micro_currency"
    t.string "charge_state"
    t.integer "tax_micro_currency"
    t.string "sku_id"
    t.string "tax_category"
    t.integer "sku_price_micro_currency"
    t.integer "quantity"
    t.string "twitter_handle"
    t.string "twitter_user_id"
    t.string "email"
    t.string "ip_address"
    t.string "device_id"
    t.string "full_name"
    t.string "street_address_1"
    t.string "street_address_2"
    t.string "city"
    t.string "zip_code"
    t.string "state"
    t.string "country"
    t.bigint "tweet_view_timestamp"
    t.string "tweet_id"
    t.integer "flags", default: 0, null: false
    t.text "json_data"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "user_agent"
    t.index ["email"], name: "index_twitter_orders_on_email"
    t.index ["purchase_id"], name: "index_twitter_orders_on_purchase_id"
    t.index ["sku_id"], name: "index_twitter_orders_on_sku_id"
    t.index ["tweet_id"], name: "index_twitter_orders_on_tweet_id"
    t.index ["twitter_order_id"], name: "index_twitter_orders_on_twitter_order_id"
  end

  create_table "url_redirects", charset: "utf8mb4", collation: "utf8mb4_unicode_ci", force: :cascade do |t|
    t.integer "uses", default: 0
    t.datetime "expires_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "purchase_id"
    t.string "token"
    t.text "webhooked_url"
    t.integer "link_id"
    t.string "customized_file_url"
    t.integer "installment_id"
    t.integer "subscription_id"
    t.integer "flags", default: 0, null: false
    t.integer "preorder_id"
    t.integer "imported_customer_id"
    t.datetime "rental_first_viewed_at"
    t.index ["imported_customer_id"], name: "index_url_redirects_on_imported_customer_id"
    t.index ["installment_id"], name: "index_url_redirects_on_installment_id"
    t.index ["preorder_id"], name: "index_url_redirects_on_preorder_id"
    t.index ["purchase_id"], name: "index_url_redirects_on_purchase_id"
    t.index ["subscription_id"], name: "index_url_redirects_on_subscription_id"
    t.index ["token"], name: "index_url_redirects_on_token"
  end

  create_table "user_categorizations", charset: "utf8mb4", collation: "utf8mb4_unicode_ci", force: :cascade do |t|
    t.integer "category_id"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_user_categorizations_on_category_id"
    t.index ["user_id"], name: "index_user_categorizations_on_user_id"
  end

  create_table "user_compliance_info", charset: "utf8mb4", collation: "utf8mb4_unicode_ci", force: :cascade do |t|
    t.integer "user_id"
    t.string "full_name"
    t.string "street_address"
    t.string "city"
    t.string "state"
    t.string "zip_code"
    t.string "country"
    t.string "telephone_number"
    t.string "vertical"
    t.boolean "is_business"
    t.boolean "has_sold_before"
    t.binary "individual_tax_id"
    t.string "json_data"
    t.integer "flags", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "business_name"
    t.string "business_street_address"
    t.string "business_city"
    t.string "business_state"
    t.string "business_zip_code"
    t.string "business_country"
    t.string "business_type"
    t.binary "business_tax_id"
    t.date "birthday"
    t.datetime "deleted_at"
    t.string "dba"
    t.text "verticals"
    t.string "first_name"
    t.string "last_name"
    t.boolean "is_business_publicly_traded"
    t.string "stripe_identity_document_id"
    t.index ["user_id"], name: "index_user_compliance_info_on_user_id"
  end

  create_table "user_compliance_info_requests", charset: "utf8mb4", collation: "utf8mb4_unicode_ci", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.string "field_needed"
    t.datetime "due_at"
    t.string "state"
    t.datetime "provided_at"
    t.text "json_data"
    t.integer "flags", default: 0, null: false
    t.index ["user_id"], name: "index_user_compliance_info_requests_on_user_id"
  end

  create_table "user_underwriting", charset: "utf8mb3", collation: "utf8mb3_unicode_ci", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "user_compliance_info_id"
    t.bigint "bank_account_id"
    t.integer "queued_by_admin_user_id"
    t.integer "approved_by_admin_user_id"
    t.string "from_relationship"
    t.string "to_relationship"
    t.string "underwriting_state"
    t.string "submission_group_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "approved_at"
    t.datetime "submitted_at"
    t.datetime "acknowledged_at"
    t.datetime "negatively_acknowledged_at"
    t.datetime "merchant_accepted_at"
    t.datetime "merchant_rejected_at"
    t.index ["bank_account_id"], name: "index_user_underwriting_on_bank_account_id"
    t.index ["user_compliance_info_id"], name: "index_user_underwriting_on_user_compliance_info_id"
    t.index ["user_id"], name: "index_user_underwriting_on_user_id"
  end

  create_table "users", charset: "utf8mb4", collation: "utf8mb4_unicode_ci", force: :cascade do |t|
    t.string "email"
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.string "payment_address"
    t.string "reset_hash"
    t.string "password_salt"
    t.datetime "confirmed_at"
    t.string "confirmation_token"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.string "provider"
    t.string "twitter_user_id"
    t.string "facebook_uid"
    t.integer "absorbed_to_user_id"
    t.datetime "deleted_at"
    t.integer "balance_cents", default: 0
    t.boolean "payment_notification", default: true
    t.string "currency_type"
    t.text "custom_css", size: :medium
    t.string "facebook_profile"
    t.string "facebook_gender"
    t.string "facebook_verified"
    t.text "bio", size: :medium
    t.string "twitter_handle"
    t.string "twitter_verified"
    t.string "twitter_location"
    t.string "username"
    t.boolean "beta"
    t.integer "credit_card_id"
    t.string "profile_picture_url"
    t.string "soundcloud_username"
    t.string "soundcloud_token"
    t.string "profile_file_name"
    t.string "profile_content_type"
    t.integer "profile_file_size"
    t.datetime "profile_updated_at"
    t.string "profile_guid"
    t.string "profile_meta"
    t.string "country"
    t.string "state"
    t.string "city"
    t.string "zip_code"
    t.string "street_address"
    t.integer "platform_id"
    t.float "platform_cut"
    t.string "fanpage"
    t.string "facebook_access_token", limit: 1024
    t.boolean "ban_flag"
    t.boolean "ban_queued"
    t.integer "number_of_views"
    t.boolean "autoban_flag"
    t.boolean "verified"
    t.boolean "manage_pages", default: false
    t.datetime "banned_at"
    t.datetime "autobanned_at"
    t.datetime "digest_sent_at"
    t.boolean "weekly_notification", default: true
    t.string "highlight_color"
    t.string "background_color"
    t.string "background_image_url"
    t.string "external_css_url"
    t.string "external_id"
    t.string "account_created_ip"
    t.string "twitter_oauth_token"
    t.string "twitter_oauth_secret"
    t.boolean "unbannable", default: false
    t.text "notification_endpoint", size: :medium
    t.boolean "is_developer", default: false
    t.string "locale"
    t.integer "flags", default: 1, null: false
    t.text "admin_notes", size: :medium
    t.string "google_analytics_id"
    t.string "timezone"
    t.string "kindle_email"
    t.string "user_risk_state"
    t.string "tos_violation_reason"
    t.text "json_data", size: :medium
    t.text "page_layout", size: :medium
    t.string "support_email"
    t.string "conversion_tracking_facebook_id"
    t.string "conversion_tracking_image_url"
    t.string "google_analytics_domains"
    t.integer "relationship", default: 0
    t.string "recommendation_type"
    t.string "background_video_url"
    t.string "theme", limit: 100
    t.string "facebook_pixel_id"
    t.string "facebook_meta_tag"
    t.integer "highlighted_membership_id"
    t.integer "tier_state", default: 0
    t.integer "purchasing_power_parity_limit"
    t.string "otp_secret_key"
    t.datetime "last_active_sessions_invalidated_at", precision: nil
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token"
    t.index ["email"], name: "index_users_on_email"
    t.index ["external_id"], name: "index_users_on_external_id"
    t.index ["facebook_uid"], name: "index_users_on_facebook_uid"
    t.index ["highlighted_membership_id"], name: "index_users_on_highlighted_membership_id"
    t.index ["name"], name: "index_users_on_name"
    t.index ["payment_address", "user_risk_state"], name: "index_users_on_payment_address_and_user_risk_state"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token"
    t.index ["twitter_oauth_token"], name: "index_users_on_twitter_oauth_token"
    t.index ["twitter_user_id"], name: "index_users_on_twitter_user_id"
    t.index ["unconfirmed_email"], name: "index_users_on_unconfirmed_email"
    t.index ["username"], name: "index_users_on_username"
  end

  create_table "variant_categories", charset: "utf8mb4", collation: "utf8mb4_unicode_ci", force: :cascade do |t|
    t.integer "link_id"
    t.datetime "deleted_at"
    t.string "title"
    t.integer "flags", default: 0, null: false
    t.index ["link_id"], name: "index_variant_categories_on_link_id"
  end

  create_table "versions", charset: "utf8mb4", collation: "utf8mb4_unicode_ci", force: :cascade do |t|
    t.string "item_type"
    t.string "{null: false}"
    t.bigint "item_id", null: false
    t.string "event", null: false
    t.string "whodunnit"
    t.text "object", size: :long
    t.datetime "created_at", precision: nil
    t.string "remote_ip"
    t.text "request_path"
    t.string "request_uuid"
    t.index ["item_type", "item_id"], name: "index_versions_on_item_type_and_item_id"
  end

  create_table "visits", charset: "utf8mb4", collation: "utf8mb4_unicode_ci", force: :cascade do |t|
    t.string "ip_address"
    t.datetime "created_at"
    t.string "entry_point"
    t.datetime "updated_at"
    t.string "fingerprint"
    t.integer "user_id"
    t.boolean "is_modal"
    t.string "browser_fingerprint"
    t.string "browser_guid"
    t.index ["browser_fingerprint"], name: "index_visits_on_browser_fingerprint"
    t.index ["browser_guid"], name: "index_visits_on_browser_guid"
    t.index ["created_at"], name: "index_visits_on_created_at"
    t.index ["entry_point"], name: "index_visits_on_entry_point"
    t.index ["fingerprint"], name: "index_visits_on_fingerprint"
    t.index ["ip_address"], name: "index_visits_on_ip_address"
  end

  create_table "workflows", charset: "utf8mb4", collation: "utf8mb4_unicode_ci", force: :cascade do |t|
    t.string "name", limit: 1024
    t.integer "seller_id"
    t.integer "link_id"
    t.string "workflow_type"
    t.datetime "published_at"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "base_variant_id"
    t.text "json_data"
    t.index ["base_variant_id"], name: "index_workflows_on_base_variant_id"
    t.index ["link_id"], name: "index_workflows_on_link_id"
    t.index ["seller_id"], name: "index_workflows_on_seller_id"
  end

  create_table "zip_tax_rates", charset: "utf8mb4", collation: "utf8mb4_unicode_ci", force: :cascade do |t|
    t.decimal "combined_rate", precision: 8, scale: 7
    t.decimal "county_rate", precision: 8, scale: 7
    t.decimal "city_rate", precision: 8, scale: 7
    t.string "state"
    t.decimal "state_rate", precision: 8, scale: 7
    t.string "tax_region_code"
    t.string "tax_region_name"
    t.string "zip_code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.decimal "special_rate", precision: 8, scale: 7
    t.integer "flags", default: 0, null: false
    t.string "country"
    t.integer "user_id"
    t.datetime "deleted_at"
    t.text "json_data"
    t.index ["user_id"], name: "index_zip_tax_rates_on_user_id"
    t.index ["zip_code"], name: "index_zip_tax_rates_on_zip_code"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "devices", "users", on_delete: :cascade
  add_foreign_key "installment_events", "events", on_delete: :cascade
  add_foreign_key "installment_events", "installments", on_delete: :cascade
  add_foreign_key "large_sellers", "users", on_delete: :cascade
  add_foreign_key "product_files_archives", "base_variants", column: "variant_id", on_delete: :cascade
end
