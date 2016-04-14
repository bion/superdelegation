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

ActiveRecord::Schema.define(version: 20160414013022) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "delayed_jobs", force: :cascade do |t|
    t.integer  "priority",   default: 0, null: false
    t.integer  "attempts",   default: 0, null: false
    t.text     "handler",                null: false
    t.text     "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string   "locked_by"
    t.string   "queue"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "delayed_jobs", ["priority", "run_at"], name: "delayed_jobs_priority", using: :btree

  create_table "delegate_messages", force: :cascade do |t|
    t.integer "message_id",  null: false
    t.integer "delegate_id", null: false
  end

  add_index "delegate_messages", ["delegate_id"], name: "index_delegate_messages_on_delegate_id", using: :btree
  add_index "delegate_messages", ["message_id"], name: "index_delegate_messages_on_message_id", using: :btree

  create_table "delegates", force: :cascade do |t|
    t.string   "state"
    t.string   "name"
    t.string   "position"
    t.string   "klass"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "messages", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "address1"
    t.string   "address2"
    t.string   "city"
    t.string   "zip"
    t.string   "email"
    t.string   "phone"
    t.string   "contents"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "state",           limit: 2
    t.string   "zip_extension"
    t.boolean  "stay_up_to_date"
    t.integer  "honorific"
  end

end
