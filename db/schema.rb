# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20171110070138) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "agents_contacts", force: :cascade do |t|
    t.integer  "agent_id"
    t.integer  "contact_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "articles", force: :cascade do |t|
    t.string   "image_url"
    t.string   "title"
    t.text     "content"
    t.integer  "tag_id"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.boolean  "popup",      default: false
  end

  create_table "assignments", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "role_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "autotask_details", force: :cascade do |t|
    t.integer  "autotask_id"
    t.integer  "item_count"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "autotasks", force: :cascade do |t|
    t.string   "name"
    t.integer  "time_interval"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "bank_accounts", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "carts", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "tmpcat"
    t.integer  "level"
    t.integer  "user_id"
    t.text     "cache_search"
  end

  create_table "categories_menus", id: false, force: :cascade do |t|
    t.integer "category_id", null: false
    t.integer "menu_id",     null: false
  end

  create_table "categories_products", id: false, force: :cascade do |t|
    t.integer "category_id"
    t.integer "product_id"
  end

  create_table "checkinout_requests", force: :cascade do |t|
    t.integer  "user_id"
    t.datetime "check_time"
    t.text     "content"
    t.integer  "status"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "manager_id"
  end

  create_table "checkinouts", force: :cascade do |t|
    t.integer  "user_id"
    t.datetime "check_time"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.date     "check_date"
    t.text     "note"
    t.integer  "checkinout_request_id"
  end

  create_table "cities", force: :cascade do |t|
    t.string   "name"
    t.integer  "state_id"
    t.integer  "city_type_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "city_types", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "combination_details", force: :cascade do |t|
    t.integer  "combination_id"
    t.integer  "product_id"
    t.integer  "stock_before"
    t.integer  "quantity"
    t.integer  "stock_after"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "serial_numbers"
  end

  create_table "combinations", force: :cascade do |t|
    t.integer  "product_id"
    t.integer  "stock_before"
    t.integer  "quantity"
    t.integer  "stock_after"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "serial_numbers"
    t.integer  "user_id"
    t.boolean  "combined",       default: true
  end

  create_table "commission_programs", force: :cascade do |t|
    t.text     "name"
    t.string   "interval_type"
    t.decimal  "min_amount"
    t.decimal  "max_amount"
    t.decimal  "commission_rate"
    t.datetime "published_at"
    t.datetime "unpublished_at"
    t.integer  "status",          default: 0
    t.text     "description"
    t.integer  "user_id"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  create_table "contact_types", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "contact_types_contacts", force: :cascade do |t|
    t.integer  "contact_id"
    t.integer  "contact_type_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "contacts", force: :cascade do |t|
    t.string   "name"
    t.string   "phone"
    t.string   "mobile"
    t.string   "fax"
    t.string   "email"
    t.string   "address"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "tax_code"
    t.text     "note"
    t.integer  "contact_type_id"
    t.string   "website"
    t.string   "account_number"
    t.string   "bank"
    t.string   "representative"
    t.string   "representative_role"
    t.string   "representative_phone"
    t.boolean  "is_mine",              default: false
    t.string   "hotline"
    t.integer  "user_id"
    t.integer  "city_id"
    t.string   "contact_types_cache"
    t.string   "image"
    t.text     "fixed_address"
    t.text     "cache_search"
  end

  create_table "countries", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "customer_order_details", force: :cascade do |t|
    t.integer  "customer_order_id"
    t.integer  "product_id"
    t.integer  "quantity"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.decimal  "price"
  end

  create_table "customer_orders", force: :cascade do |t|
    t.string   "orderer_first_name"
    t.string   "orderer_last_name"
    t.string   "orderer_company_name"
    t.string   "orderer_email"
    t.string   "orderer_address_1"
    t.string   "orderer_address_2"
    t.string   "orderer_phone"
    t.string   "orderer_fax"
    t.text     "orderer_message"
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
    t.string   "orderer_tax"
    t.boolean  "is_invoice",           default: false
  end

  create_table "deliveries", force: :cascade do |t|
    t.integer  "order_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "creator_id"
    t.integer  "delivery_person_id"
    t.integer  "is_return",          default: 0
    t.integer  "status",             default: 1
    t.datetime "delivery_date"
  end

  create_table "delivery_details", force: :cascade do |t|
    t.integer  "delivery_id"
    t.integer  "order_detail_id"
    t.integer  "quantity"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "serial_numbers"
    t.integer  "product_id"
  end

  create_table "feedbacks", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "title"
    t.text     "content"
    t.string   "image"
    t.integer  "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "line_items", force: :cascade do |t|
    t.integer  "product_id"
    t.integer  "cart_id"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.integer  "quantity",   default: 1
  end

  add_index "line_items", ["cart_id"], name: "index_line_items_on_cart_id", using: :btree
  add_index "line_items", ["product_id"], name: "index_line_items_on_product_id", using: :btree

  create_table "logins", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "logins", ["email"], name: "index_logins_on_email", unique: true, using: :btree
  add_index "logins", ["reset_password_token"], name: "index_logins_on_reset_password_token", unique: true, using: :btree

  create_table "manages", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "manufacturers", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "tmpmenu"
    t.integer  "user_id"
  end

  create_table "menus", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "level"
    t.string   "image_url"
    t.string   "menu_image"
  end

  create_table "messages", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "phone"
    t.text     "messages"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "newsletters", force: :cascade do |t|
    t.string   "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "notifications", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "sender_id"
    t.text     "title"
    t.text     "description"
    t.integer  "viewed",      default: 0
    t.text     "url"
    t.text     "icon"
    t.text     "type_name"
    t.integer  "item_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "order_details", force: :cascade do |t|
    t.integer  "order_id"
    t.integer  "product_id"
    t.integer  "quantity"
    t.decimal  "price",               precision: 16, scale: 2
    t.string   "product_name"
    t.integer  "warranty"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "unit"
    t.text     "product_description"
    t.integer  "product_price_id"
    t.decimal  "discount_amount"
    t.decimal  "tip_amount",                                   default: 0.0
    t.decimal  "shipment_amount",                              default: 0.0
  end

  create_table "order_statuses", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "order_statuses_orders", force: :cascade do |t|
    t.integer  "order_id"
    t.integer  "order_status_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  create_table "orders", force: :cascade do |t|
    t.integer  "customer_id"
    t.integer  "supplier_id"
    t.integer  "agent_id"
    t.string   "shipping_place"
    t.integer  "payment_method_id"
    t.datetime "payment_deadline"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "buyer_name"
    t.string   "buyer_company"
    t.string   "buyer_tax_code"
    t.string   "buyer_address"
    t.string   "buyer_email"
    t.string   "buyer_phone"
    t.string   "buyer_fax"
    t.integer  "tax_id"
    t.datetime "order_date"
    t.datetime "order_deadline"
    t.string   "quotation_code",       default: "HK-0000-000"
    t.integer  "salesperson_id"
    t.integer  "deposit"
    t.datetime "shipping_date"
    t.string   "shipping_time"
    t.string   "warranty_place"
    t.text     "warranty_cost"
    t.integer  "older_id"
    t.text     "watermark"
    t.integer  "order_status_id"
    t.integer  "newer_id"
    t.integer  "parent_id"
    t.integer  "purchase_manager_id"
    t.datetime "debt_date"
    t.string   "delivery_status_name"
    t.string   "payment_status_name"
    t.string   "customer_po"
    t.text     "printed_order_number"
    t.integer  "supplier_agent_id"
    t.string   "order_status_name"
    t.string   "price_status_name"
    t.integer  "user_id"
    t.string   "tip_status_name"
    t.integer  "purchaser_id"
    t.integer  "tip_contact_id"
    t.integer  "shipment_contact_id"
    t.decimal  "cache_total"
    t.text     "cache_search"
  end

  create_table "parent_categories", force: :cascade do |t|
    t.integer "category_id"
    t.integer "parent_id"
  end

  create_table "parent_contacts", force: :cascade do |t|
    t.integer "contact_id"
    t.integer "parent_id"
  end

  create_table "parent_menus", force: :cascade do |t|
    t.integer  "parent_id"
    t.integer  "menu_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "partners", force: :cascade do |t|
    t.string   "image_url"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "manufacturer_id"
  end

  create_table "payment_methods", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "print_name"
  end

  create_table "payment_records", force: :cascade do |t|
    t.integer  "order_id"
    t.integer  "accountant_id"
    t.decimal  "amount"
    t.integer  "debt_days"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "note"
    t.text     "paid_person"
    t.text     "paid_address"
    t.datetime "debt_date"
    t.integer  "payment_method_id"
    t.boolean  "is_tip",            default: false
    t.datetime "paid_date"
    t.integer  "status",            default: 1
    t.boolean  "is_custom",         default: false
    t.boolean  "is_recieved",       default: false
    t.string   "type_name"
    t.integer  "bank_account_id"
  end

  create_table "product_images", force: :cascade do |t|
    t.integer  "product_id"
    t.string   "filename"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "display_order"
  end

  create_table "product_infos", force: :cascade do |t|
    t.string   "image_url"
    t.text     "description"
    t.decimal  "old_price"
    t.string   "product_hot"
    t.string   "product_sale"
    t.string   "product_bestselled"
    t.string   "product_prominent"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.integer  "product_id"
    t.text     "note"
    t.string   "product_new"
    t.decimal  "sale_off_price"
    t.decimal  "sale_price"
    t.text     "bonus_product"
  end

  create_table "product_parts", force: :cascade do |t|
    t.integer  "product_id"
    t.integer  "part_id"
    t.integer  "quantity",   default: 1
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "product_prices", force: :cascade do |t|
    t.integer  "product_id"
    t.decimal  "price"
    t.decimal  "supplier_price"
    t.integer  "supplier_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.integer  "customer_id"
    t.decimal  "public_price",   default: 0.0
  end

  create_table "product_stock_updates", force: :cascade do |t|
    t.integer  "product_id"
    t.integer  "quantity"
    t.text     "serial_numbers"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "is_import"
    t.integer  "user_id"
    t.text     "note"
  end

  create_table "products", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.decimal  "price",             precision: 16, scale: 2
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "product_code"
    t.string   "warranty"
    t.integer  "manufacturer_id"
    t.string   "unit"
    t.integer  "user_id"
    t.integer  "tmpproduct"
    t.integer  "stock",                                      default: 0
    t.text     "serial_numbers"
    t.integer  "status",                                     default: 1
    t.text     "note"
    t.text     "cache_search"
    t.text     "intro"
    t.integer  "tax_id"
    t.text     "short_intro"
    t.boolean  "no_price"
    t.boolean  "erp_price_updated",                          default: false
    t.boolean  "erp_imported",                               default: false
    t.boolean  "suspended",                                  default: false
    t.boolean  "erp_sold_out",                               default: false
    t.text     "html_description"
    t.decimal  "web_price",         precision: 16, scale: 2
  end

  create_table "roles", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "slide_shows", force: :cascade do |t|
    t.string   "image_url"
    t.text     "description"
    t.string   "link_to"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "title"
  end

  create_table "states", force: :cascade do |t|
    t.string   "name"
    t.integer  "country_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tags", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "taxes", force: :cascade do |t|
    t.string   "name"
    t.decimal  "rate"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tmpcats", force: :cascade do |t|
    t.text "category_id"
    t.text "category_image"
    t.text "category_parent_id"
    t.text "category_publish"
    t.text "category_ordertype"
    t.text "category_template"
    t.text "category_ordering"
    t.text "category_add_date"
    t.text "products_page"
    t.text "products_row"
    t.text "name_en_GB"
    t.text "alias_en_GB"
    t.text "short_description_en_GB"
    t.text "description_en_GB"
    t.text "meta_title_en_GB"
    t.text "meta_description_en_GB"
    t.text "meta_keyword_en_GB"
    t.text "name_vi_VN"
    t.text "alias_vi_VN"
    t.text "short_description_vi_VN"
    t.text "description_vi_VN"
    t.text "meta_title_vi_VN"
    t.text "meta_description_vi_VN"
    t.text "meta_keyword_vi_VN"
  end

  create_table "tmpmanus", force: :cascade do |t|
    t.text     "manufacturer_id"
    t.text     "manufacturer_url"
    t.text     "manufacturer_logo"
    t.text     "manufacturer_publish"
    t.text     "products_page"
    t.text     "products_row"
    t.text     "ordering"
    t.text     "name_en_gb"
    t.text     "alias_en_gb"
    t.text     "short_description_en_gb"
    t.text     "description_en_gb"
    t.text     "meta_title_en_gb"
    t.text     "meta_description_en_gb"
    t.text     "meta_keyword_en_gb"
    t.text     "name_vi_vn"
    t.text     "alias_vi_vn"
    t.text     "short_description_vi_vn"
    t.text     "description_vi_vn"
    t.text     "meta_title_vi_vn"
    t.text     "meta_description_vi_vn"
    t.text     "meta_keyword_vi_vn"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tmpproducts", force: :cascade do |t|
    t.text     "product_id"
    t.text     "product_ean"
    t.text     "product_quantity"
    t.text     "unlimited"
    t.text     "product_availability"
    t.text     "product_date_added"
    t.text     "date_modify"
    t.text     "product_publish"
    t.text     "product_tax_id"
    t.text     "product_template"
    t.text     "product_url"
    t.text     "product_old_price"
    t.text     "product_buy_price"
    t.text     "product_price"
    t.text     "min_price"
    t.text     "different_prices"
    t.text     "product_weight"
    t.text     "product_thumb_image"
    t.text     "product_name_image"
    t.text     "product_full_image"
    t.text     "product_manufacturer_id"
    t.text     "product_is_add_price"
    t.text     "average_rating"
    t.text     "reviews_count"
    t.text     "delivery_times_id"
    t.text     "hits"
    t.text     "weight_volume_units"
    t.text     "basic_price_unit_id"
    t.text     "label_id"
    t.text     "vendor_id"
    t.text     "name_en_gb"
    t.text     "alias_en_gb"
    t.text     "short_description_en_gb"
    t.text     "description_en_gb"
    t.text     "meta_title_en_gb"
    t.text     "meta_description_en_gb"
    t.text     "meta_keyword_en_gb"
    t.text     "product_warranty"
    t.text     "name_vi_vn"
    t.text     "alias_vi_vn"
    t.text     "short_description_vi_vn"
    t.text     "description_vi_vn"
    t.text     "meta_title_vi_vn"
    t.text     "meta_description_vi_vn"
    t.text     "meta_keyword_vi_vn"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tmpproducttocats", force: :cascade do |t|
    t.text     "product_id"
    t.text     "category_id"
    t.text     "product_ordering"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "phone_ext"
    t.string   "mobile"
    t.string   "ATT_No"
    t.string   "image"
    t.boolean  "is_soft",                default: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "users_worksheets", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "worksheet_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "worksheet_expenses", force: :cascade do |t|
    t.string   "name"
    t.decimal  "price"
    t.string   "type_name"
    t.text     "description"
    t.integer  "creator_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "status"
  end

  create_table "worksheet_intineraries", force: :cascade do |t|
    t.string   "start_address"
    t.string   "end_address"
    t.datetime "start_at"
    t.datetime "end_at"
    t.decimal  "distance"
    t.text     "description"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "worksheet_id"
  end

  create_table "worksheets", force: :cascade do |t|
    t.integer  "creator_id"
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.string   "status",     default: "active"
  end

  create_table "worksheets_worksheet_expenses", force: :cascade do |t|
    t.integer "worksheet_id"
    t.integer "worksheet_expense_id"
    t.decimal "price"
    t.string  "description"
  end

  add_foreign_key "line_items", "carts"
  add_foreign_key "line_items", "products"
end
