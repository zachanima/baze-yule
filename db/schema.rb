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

ActiveRecord::Schema.define(:version => 20101007145139) do

  create_table "product_templates", :force => true do |t|
    t.string   "name"
    t.string   "identifier"
    t.string   "brand"
    t.text     "text"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image_file_name"
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

end
