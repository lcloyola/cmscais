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

ActiveRecord::Schema.define(:version => 20121126135139) do

  create_table "items", :force => true do |t|
    t.string   "name"
    t.text     "remarks"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "locations", :force => true do |t|
    t.string   "name"
    t.decimal  "longmin",    :precision => 10, :scale => 0
    t.decimal  "longmax",    :precision => 10, :scale => 0
    t.decimal  "latmin",     :precision => 10, :scale => 0
    t.decimal  "latmax",     :precision => 10, :scale => 0
    t.text     "iprange"
    t.datetime "created_at",                                :null => false
    t.datetime "updated_at",                                :null => false
  end

  create_table "logs", :force => true do |t|
    t.integer  "unit_id"
    t.integer  "properties_id"
    t.text     "value"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "logs", ["properties_id"], :name => "index_logs_on_properties_id"
  add_index "logs", ["unit_id"], :name => "index_logs_on_unit_id"

  create_table "properties", :force => true do |t|
    t.integer  "item_id"
    t.string   "name"
    t.text     "remarks"
    t.integer  "datatype"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "properties", ["item_id"], :name => "index_properties_on_item_id"

  create_table "sublocations", :force => true do |t|
    t.integer  "parent_id_id"
    t.integer  "child_id_id"
    t.text     "remarks"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  add_index "sublocations", ["child_id_id"], :name => "index_sublocations_on_child_id_id"
  add_index "sublocations", ["parent_id_id"], :name => "index_sublocations_on_parent_id_id"

  create_table "units", :force => true do |t|
    t.integer  "item_id"
    t.integer  "user_id"
    t.integer  "location_id"
    t.string   "name"
    t.boolean  "is_public"
    t.text     "remarks"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "units", ["item_id"], :name => "index_units_on_item_id"
  add_index "units", ["location_id"], :name => "index_units_on_location_id"
  add_index "units", ["user_id"], :name => "index_units_on_user_id"

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "",    :null => false
    t.string   "encrypted_password",     :default => "",    :null => false
    t.boolean  "admin",                  :default => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                                :null => false
    t.datetime "updated_at",                                :null => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
