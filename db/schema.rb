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

ActiveRecord::Schema.define(:version => 20130416170739) do

  create_table "authorizations", :force => true do |t|
    t.string   "provider"
    t.string   "uid"
    t.integer  "user_id"
    t.string   "token"
    t.string   "secret"
    t.string   "name"
    t.string   "link"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "images", :force => true do |t|
    t.string   "name"
    t.string   "url"
    t.text     "description"
    t.integer  "work_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "inkwell_blog_items", :force => true do |t|
    t.integer  "item_id"
    t.boolean  "is_reblog"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "owner_id"
    t.string   "item_type"
    t.string   "owner_type"
  end

  create_table "inkwell_comments", :force => true do |t|
    t.integer  "user_id"
    t.text     "body"
    t.integer  "parent_comment_id"
    t.integer  "topmost_obj_id"
    t.text     "upper_comments_tree"
    t.text     "users_ids_who_favorite_it", :default => "[]"
    t.text     "users_ids_who_comment_it",  :default => "[]"
    t.text     "users_ids_who_reblog_it",   :default => "[]"
    t.datetime "created_at",                                  :null => false
    t.datetime "updated_at",                                  :null => false
    t.string   "topmost_obj_type"
  end

  create_table "inkwell_favorite_items", :force => true do |t|
    t.integer  "item_id"
    t.integer  "owner_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "item_type"
    t.string   "owner_type"
  end

  create_table "inkwell_followings", :force => true do |t|
    t.integer  "follower_id"
    t.integer  "followed_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "inkwell_timeline_items", :force => true do |t|
    t.integer  "item_id"
    t.integer  "owner_id"
    t.text     "from_source",      :default => "[]"
    t.boolean  "has_many_sources", :default => false
    t.datetime "created_at",                          :null => false
    t.datetime "updated_at",                          :null => false
    t.string   "item_type"
    t.string   "owner_type"
  end

  create_table "rails_admin_histories", :force => true do |t|
    t.text     "message"
    t.string   "username"
    t.integer  "item"
    t.string   "table"
    t.integer  "month",      :limit => 2
    t.integer  "year",       :limit => 8
    t.datetime "created_at",              :null => false
    t.datetime "updated_at",              :null => false
  end

  add_index "rails_admin_histories", ["item", "table", "month", "year"], :name => "index_rails_admin_histories"

  create_table "sources", :force => true do |t|
    t.string   "name"
    t.string   "url"
    t.text     "description"
    t.integer  "work_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "authentication_token"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.string   "role"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "patronymic"
    t.integer  "follower_count",         :default => 0
    t.integer  "following_count",        :default => 0
  end

  add_index "users", ["authentication_token"], :name => "index_users_on_authentication_token", :unique => true
  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

  create_table "videos", :force => true do |t|
    t.string   "name"
    t.string   "url"
    t.text     "description"
    t.integer  "work_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "works", :force => true do |t|
    t.string   "name"
    t.string   "nomination"
    t.string   "image"
    t.text     "description"
    t.integer  "user_id"
    t.datetime "created_at",                                  :null => false
    t.datetime "updated_at",                                  :null => false
    t.text     "users_ids_who_favorite_it", :default => "[]"
    t.text     "users_ids_who_comment_it",  :default => "[]"
    t.text     "users_ids_who_reblog_it",   :default => "[]"
  end

end
