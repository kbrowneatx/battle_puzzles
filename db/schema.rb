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

ActiveRecord::Schema.define(:version => 20130703023154) do

  create_table "armies", :force => true do |t|
    t.string   "name"
    t.integer  "total_xp",           :default => 0
    t.integer  "divisions_allowed",  :default => 2
    t.integer  "battalions_allowed", :default => 6
    t.integer  "user_id"
    t.integer  "era_id"
    t.integer  "nation_id"
    t.datetime "created_at",                        :null => false
    t.datetime "updated_at",                        :null => false
  end

  add_index "armies", ["era_id"], :name => "index_armies_on_era_id"
  add_index "armies", ["nation_id"], :name => "index_armies_on_nation_id"

  create_table "battalions", :force => true do |t|
    t.string   "name"
    t.integer  "health"
    t.integer  "division_id"
    t.integer  "unit_type_id"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  add_index "battalions", ["division_id"], :name => "index_battalions_on_division_id"
  add_index "battalions", ["unit_type_id"], :name => "index_battalions_on_unit_type_id"

  create_table "divisions", :force => true do |t|
    t.string   "name"
    t.integer  "army_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "divisions", ["army_id"], :name => "index_divisions_on_army_id"

  create_table "eras", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "nations", :force => true do |t|
    t.string   "name"
    t.string   "flag_img"
    t.integer  "era_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "nations", ["era_id"], :name => "index_nations_on_era_id"

  create_table "unit_types", :force => true do |t|
    t.string   "name"
    t.integer  "era_id"
    t.integer  "nation_id"
    t.string   "img_name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "unit_types", ["era_id"], :name => "index_unit_types_on_era_id"
  add_index "unit_types", ["nation_id"], :name => "index_unit_types_on_nation_id"

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "",       :null => false
    t.string   "encrypted_password",     :default => "",       :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "gamer_name",             :default => "",       :null => false
    t.string   "role",                   :default => "player", :null => false
    t.integer  "games_allowed",          :default => 2
    t.datetime "created_at",                                   :null => false
    t.datetime "updated_at",                                   :null => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
