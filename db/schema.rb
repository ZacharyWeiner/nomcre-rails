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

ActiveRecord::Schema.define(version: 20171001160808) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "chatrooms", force: :cascade do |t|
    t.string   "topic"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "collection_items", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "collection_id"
    t.string   "file"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["collection_id"], name: "index_collection_items_on_collection_id", using: :btree
    t.index ["user_id"], name: "index_collection_items_on_user_id", using: :btree
  end

  create_table "collections", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_collections_on_user_id", using: :btree
  end

  create_table "companies", force: :cascade do |t|
    t.string   "name"
    t.string   "logo"
    t.string   "phone"
    t.string   "website"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "messages", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "chatroom_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.text     "content"
    t.index ["chatroom_id"], name: "index_messages_on_chatroom_id", using: :btree
    t.index ["user_id"], name: "index_messages_on_user_id", using: :btree
  end

  create_table "proposals", force: :cascade do |t|
    t.string   "title"
    t.text     "content"
    t.date     "deadline"
    t.integer  "price"
    t.boolean  "accepted"
    t.integer  "company_id"
    t.string   "proposal_type"
    t.boolean  "completed"
    t.date     "completed_on"
    t.boolean  "paid"
    t.string   "charge_id"
    t.text     "bts",             default: [],              array: true
    t.text     "focus_points",    default: [],              array: true
    t.string   "time_of_day"
    t.string   "location"
    t.string   "background"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.integer  "user_id"
    t.string   "deposit_id"
    t.boolean  "deposit_paid"
    t.date     "deposit_paid_on"
    t.index ["company_id"], name: "index_proposals_on_company_id", using: :btree
    t.index ["user_id"], name: "index_proposals_on_user_id", using: :btree
  end

  create_table "schedule_items", force: :cascade do |t|
    t.date     "start_date"
    t.date     "end_date"
    t.string   "location"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text     "notes"
    t.index ["user_id"], name: "index_schedule_items_on_user_id", using: :btree
  end

  create_table "tasks", force: :cascade do |t|
    t.integer  "user_id"
    t.text     "description"
    t.date     "deadline"
    t.boolean  "completed"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "company_id"
    t.integer  "proposal_id"
    t.index ["company_id"], name: "index_tasks_on_company_id", using: :btree
    t.index ["proposal_id"], name: "index_tasks_on_proposal_id", using: :btree
    t.index ["user_id"], name: "index_tasks_on_user_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "name"
    t.integer  "role"
    t.string   "profile_image"
    t.integer  "company_id"
    t.string   "user_type"
    t.index ["company_id"], name: "index_users_on_company_id", using: :btree
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  create_table "waitlists", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "instragram"
    t.string   "px500"
    t.string   "facebook"
    t.string   "phone"
    t.string   "website"
    t.string   "smugmug"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "collection_items", "collections"
  add_foreign_key "collection_items", "users"
  add_foreign_key "collections", "users"
  add_foreign_key "messages", "chatrooms"
  add_foreign_key "messages", "users"
  add_foreign_key "proposals", "companies"
  add_foreign_key "proposals", "users"
  add_foreign_key "schedule_items", "users"
  add_foreign_key "tasks", "companies"
  add_foreign_key "tasks", "proposals"
  add_foreign_key "tasks", "users"
  add_foreign_key "users", "companies"
end
