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

ActiveRecord::Schema.define(:version => 20120625225445) do

  create_table "courses", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "notegroups", :force => true do |t|
    t.integer  "presentation_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "pads"
  end

  create_table "notegroups_users", :id => false, :force => true do |t|
    t.integer "notegroup_id"
    t.integer "user_id"
  end

  create_table "presentations", :force => true do |t|
    t.integer  "course_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "deck_file_name"
    t.string   "deck_content_type"
    t.integer  "deck_file_size"
    t.datetime "deck_updated_at"
    t.string   "deckoriginal_file_name"
    t.string   "deckoriginal_content_type"
    t.integer  "deckoriginal_file_size"
    t.datetime "deckoriginal_updated_at"
  end

  create_table "slides", :force => true do |t|
    t.integer  "number"
    t.string   "title"
    t.text     "content"
    t.integer  "presentation_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.text     "slidetext"
  end

  create_table "users", :force => true do |t|
    t.string   "login"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "crypted_password"
    t.string   "password_salt"
    t.string   "persistence_token"
    t.string   "auth_type"
    t.string   "perishable_token"
    t.boolean  "superuser"
    t.boolean  "supermode"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
