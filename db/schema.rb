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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120626063703) do

  create_table "authentications", :force => true do |t|
    t.integer  "user_id"
    t.string   "provider"
    t.string   "uid"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "checkins", :force => true do |t|
    t.integer  "restaurant_id"
    t.integer  "user_id"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "companies", :force => true do |t|
    t.string   "name"
    t.string   "location"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "restaurants", :force => true do |t|
    t.string   "name"
    t.string   "theme"
    t.string   "image"
    t.integer  "price_range"
    t.string   "payment_options"
    t.integer  "service"
    t.integer  "time"
    t.string   "location"
    t.string   "area"
    t.integer  "vegi"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.string   "menu_url"
    t.string   "address"
    t.integer  "heading"
  end

  create_table "tips", :force => true do |t|
    t.integer  "restuarant_id"
    t.integer  "checkin_id"
    t.integer  "user_id"
    t.text     "content"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.integer  "company_id"
    t.string   "role"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

end
