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

ActiveRecord::Schema[7.0].define(version: 2025_06_27_204329) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "action_text_rich_texts", force: :cascade do |t|
    t.string "name", null: false
    t.text "body"
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["record_type", "record_id", "name"], name: "index_action_text_rich_texts_uniqueness", unique: true
  end

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
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

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "cats", force: :cascade do |t|
    t.string "name"
    t.string "breed"
    t.string "color"
    t.date "date_of_birth"
    t.string "gender"
    t.text "description"
    t.string "pedigree_information"
    t.decimal "price"
    t.string "status"
    t.string "vaccination_information"
    t.string "health_status"
    t.string "owner_information"
    t.string "location"
    t.boolean "neutered"
    t.text "notes"
    t.string "videos"
    t.boolean "is_parent"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "channel_products", force: :cascade do |t|
    t.bigint "channel_id", null: false
    t.bigint "product_id", null: false
    t.string "external_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["channel_id"], name: "index_channel_products_on_channel_id"
    t.index ["product_id"], name: "index_channel_products_on_product_id"
  end

  create_table "channels", force: :cascade do |t|
    t.string "platform"
    t.string "name"
    t.string "token"
    t.string "shop_domain"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "comments", force: :cascade do |t|
    t.bigint "post_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["post_id"], name: "index_comments_on_post_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "order_items", force: :cascade do |t|
    t.bigint "order_id", null: false
    t.bigint "product_id", null: false
    t.integer "quantity"
    t.decimal "unit_price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["order_id"], name: "index_order_items_on_order_id"
    t.index ["product_id"], name: "index_order_items_on_product_id"
  end

  create_table "orders", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "status"
    t.decimal "total"
    t.string "payment_method"
    t.string "external_id"
    t.datetime "paid_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_orders_on_user_id"
  end

  create_table "photos", force: :cascade do |t|
    t.string "title"
    t.text "image_data"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "cat_id"
    t.bigint "post_id"
    t.index ["cat_id"], name: "index_photos_on_cat_id"
    t.index ["post_id"], name: "index_photos_on_post_id"
  end

  create_table "posts", force: :cascade do |t|
    t.string "title"
    t.text "content"
    t.datetime "published_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.index ["user_id"], name: "index_posts_on_user_id"
  end

  create_table "products", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.decimal "price"
    t.integer "stock"
    t.boolean "active"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "quizzes", force: :cascade do |t|
    t.string "question"
    t.text "answer"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "choice_a"
    t.string "choice_b"
    t.string "choice_c"
    t.string "choice_d"
    t.string "correct_choice"
  end

  create_table "reservations", force: :cascade do |t|
    t.bigint "cat_id", null: false
    t.date "start_date"
    t.date "end_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "deposit_paid", default: false
    t.index ["cat_id"], name: "index_reservations_on_cat_id"
  end

  create_table "shipments", force: :cascade do |t|
    t.bigint "order_id", null: false
    t.string "carrier"
    t.string "tracking_number"
    t.string "status"
    t.text "label_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["order_id"], name: "index_shipments_on_order_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name", default: "", null: false
    t.string "last_name", default: "", null: false
    t.string "phone_number", default: "", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.integer "role", default: 0, null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "provider"
    t.string "uid"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "channel_products", "channels"
  add_foreign_key "channel_products", "products"
  add_foreign_key "comments", "posts"
  add_foreign_key "comments", "users"
  add_foreign_key "order_items", "orders"
  add_foreign_key "order_items", "products"
  add_foreign_key "orders", "users"
  add_foreign_key "photos", "cats"
  add_foreign_key "photos", "posts"
  add_foreign_key "posts", "users"
  add_foreign_key "reservations", "cats"
  add_foreign_key "shipments", "orders"
end
