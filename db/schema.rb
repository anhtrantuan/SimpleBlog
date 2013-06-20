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

ActiveRecord::Schema.define(:version => 20130611030532) do

  create_table "categories", :force => true do |t|
    t.string "name"
    t.text   "description"
  end

  create_table "categorizations", :force => true do |t|
    t.integer "category_id"
    t.integer "entry_id"
  end

  create_table "comments", :force => true do |t|
    t.string   "author"
    t.text     "content"
    t.integer  "entry_id"
    t.datetime "created_at", :default => '2013-06-14 03:51:45'
  end

  create_table "entries", :force => true do |t|
    t.string   "title"
    t.text     "content"
    t.datetime "published", :default => '2013-06-14 03:51:45'
  end

  create_table "users", :force => true do |t|
    t.string "email"
    t.string "password_digest"
  end

end