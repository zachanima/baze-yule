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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20101011065845) do

  create_table "option_groups", :force => true do |t|
    t.string   "text"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "product_id"
  end

  create_table "options", :force => true do |t|
    t.string   "text"
    t.integer  "option_group_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "options_orders", :id => false, :force => true do |t|
    t.integer "option_id"
    t.integer "order_id"
  end

  create_table "orders", :force => true do |t|
    t.integer  "user_id"
    t.integer  "product_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "products", :force => true do |t|
    t.string   "name"
    t.string   "identifier"
    t.string   "brand"
    t.text     "text"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image_file_name"
    t.integer  "shop_id"
  end

  create_table "shops", :force => true do |t|
    t.string   "name"
    t.string   "slug"
    t.string   "username_text"
    t.string   "password_text"
    t.text     "text"
    t.date     "opens_on"
    t.date     "closes_on"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "logo_file_name"
    t.string   "locale"
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "username"
    t.text     "department"
    t.integer  "shop_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "encrypted_password", :limit => 128, :default => "", :null => false
    t.string   "password_salt",                     :default => "", :null => false
    t.integer  "sign_in_count",                     :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
  end

end
