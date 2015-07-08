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

ActiveRecord::Schema.define(version: 20150707002537) do

  create_table "Company", primary_key: "company_id", force: :cascade do |t|
    t.string "company_name", limit: 100, null: false
    t.string "street",       limit: 100
    t.string "city",         limit: 100
    t.string "state",        limit: 2
    t.string "country",      limit: 3
    t.string "zip",          limit: 10
  end

  create_table "Connections", id: false, force: :cascade do |t|
    t.string "user_id",   limit: 18, null: false
    t.string "friend_id", limit: 18, null: false
    t.string "type",      limit: 20
    t.date   "date"
    t.string "status",    limit: 20
  end

  add_index "Connections", ["friend_id"], name: "friend_id", using: :btree
  add_index "Connections", ["user_id"], name: "user_id", using: :btree

  create_table "Device", primary_key: "dev_id", force: :cascade do |t|
    t.string "device_name", limit: 50, null: false
    t.string "device_type", limit: 20
    t.string "company_id",  limit: 18
  end

  add_index "Device", ["company_id"], name: "company_id", using: :btree

  create_table "Devices_Owned", id: false, force: :cascade do |t|
    t.string "hospital_id", limit: 18, null: false
    t.string "dev_id",      limit: 18, null: false
  end

  add_index "Devices_Owned", ["dev_id"], name: "dev_id", using: :btree
  add_index "Devices_Owned", ["hospital_id"], name: "hospital_id", using: :btree

  create_table "Doctor", id: false, force: :cascade do |t|
    t.string  "doctor_id",      limit: 18, null: false
    t.string  "specialization", limit: 30
    t.integer "experience",     limit: 4
    t.string  "designation",    limit: 25
  end

  add_index "Doctor", ["doctor_id"], name: "doctor_id", unique: true, using: :btree

  create_table "Doctor_Workplace", id: false, force: :cascade do |t|
    t.string "user_id",     limit: 18, null: false
    t.string "hospital_id", limit: 18, null: false
  end

  add_index "Doctor_Workplace", ["hospital_id"], name: "hospital_id", using: :btree
  add_index "Doctor_Workplace", ["user_id"], name: "user_id", using: :btree

  create_table "Document", primary_key: "document_id", force: :cascade do |t|
    t.string   "user_id",       limit: 18,  null: false
    t.string   "document_name", limit: 30
    t.string   "document_type", limit: 5
    t.integer  "size",          limit: 4
    t.datetime "last_modified"
    t.string   "location",      limit: 100
  end

  add_index "Document", ["user_id"], name: "user_id", using: :btree

  create_table "Document_Folder", id: false, force: :cascade do |t|
    t.string "folder_id",   limit: 18, null: false
    t.string "document_id", limit: 18
  end

  add_index "Document_Folder", ["document_id"], name: "document_id", using: :btree
  add_index "Document_Folder", ["folder_id"], name: "folder_id", using: :btree

  create_table "Event", primary_key: "event_id", force: :cascade do |t|
    t.string   "event_name",              limit: 100
    t.text     "description",             limit: 65535
    t.string   "categories",              limit: 0
    t.string   "event_security",          limit: 7
    t.string   "author_user_id",          limit: 18
    t.datetime "timestamp_created"
    t.datetime "timestamp_updated"
    t.datetime "start_date_time"
    t.datetime "end_date_time"
    t.string   "location_street_address", limit: 100
    t.string   "location_city",           limit: 100
    t.string   "location_state",          limit: 2
    t.string   "location_zipcode",        limit: 10
    t.string   "location_country_code",   limit: 3
    t.datetime "reoccur_date_start"
    t.datetime "reoccur_date_end"
    t.string   "reoccur_days_of_week",    limit: 0
  end

  create_table "Event_Admin", id: false, force: :cascade do |t|
    t.string "user_id",  limit: 18
    t.string "event_id", limit: 18
  end

  create_table "Event_Comment", primary_key: "comment_id", force: :cascade do |t|
    t.string   "author_user_id",   limit: 18
    t.string   "content",          limit: 300
    t.string   "document_id",      limit: 18
    t.string   "event_id",         limit: 18
    t.datetime "update_date_time"
  end

  create_table "Event_Comment_Reply", primary_key: "comment_reply_id", force: :cascade do |t|
    t.string   "comment_id",       limit: 18
    t.string   "author_user_id",   limit: 18
    t.string   "content",          limit: 300
    t.datetime "update_date_time"
  end

  create_table "Event_Invited_User", id: false, force: :cascade do |t|
    t.string   "user_id",           limit: 18
    t.string   "status",            limit: 8
    t.datetime "invited_date_time"
    t.datetime "updated_date_time"
    t.string   "event_id",          limit: 18
  end

  create_table "Event_Reminder", primary_key: "reminder_id", force: :cascade do |t|
    t.datetime "date_time"
    t.text     "method",    limit: 65535
    t.string   "event_id",  limit: 18
    t.string   "user_id",   limit: 18
  end

  create_table "Event_Resource", primary_key: "resource_id", force: :cascade do |t|
    t.string  "resource_name",   limit: 100
    t.integer "img_doc_id",      limit: 4
    t.boolean "checked_status",  limit: 1
    t.string  "checked_user_id", limit: 18
    t.string  "event_id",        limit: 18
  end

  create_table "Feedback", primary_key: "feedback_id", force: :cascade do |t|
    t.string   "user_id",          limit: 18
    t.string   "document_id",      limit: 18
    t.string   "content",          limit: 300
    t.datetime "update_date_time"
  end

  create_table "Folder", primary_key: "folder_id", force: :cascade do |t|
    t.string   "user_id",       limit: 18,  null: false
    t.string   "folder_name",   limit: 20
    t.datetime "last_accessed"
    t.integer  "size",          limit: 4
    t.string   "location",      limit: 100
  end

  add_index "Folder", ["user_id"], name: "user_id", using: :btree

  create_table "Hospital", primary_key: "hospital_id", force: :cascade do |t|
    t.string "hospital_name", limit: 100, null: false
    t.string "street",        limit: 100
    t.string "city",          limit: 100
    t.string "state",         limit: 2
    t.string "country",       limit: 3
    t.string "zip",           limit: 10
  end

  create_table "Reply_Feedback", primary_key: "reply_feedback_id", force: :cascade do |t|
    t.string   "feedback_id",      limit: 18
    t.string   "user_id",          limit: 18
    t.string   "content",          limit: 300
    t.datetime "update_date_time"
  end

  create_table "Representative", id: false, force: :cascade do |t|
    t.string  "rep_id",      limit: 18, null: false
    t.string  "designation", limit: 30
    t.string  "company_id",  limit: 18, null: false
    t.integer "experience",  limit: 4
  end

  add_index "Representative", ["company_id"], name: "company_id", using: :btree
  add_index "Representative", ["rep_id"], name: "rep_id", using: :btree

  create_table "Share_Document", id: false, force: :cascade do |t|
    t.string  "document_id", limit: 18, null: false
    t.string  "user_id",     limit: 18, null: false
    t.integer "permission",  limit: 4
  end

  add_index "Share_Document", ["document_id"], name: "document_id", using: :btree
  add_index "Share_Document", ["user_id"], name: "user_id", using: :btree

  create_table "Social_Links", id: false, force: :cascade do |t|
    t.string "user_id", limit: 18, null: false
    t.string "link",    limit: 30, null: false
    t.string "type",    limit: 20, null: false
  end

  add_index "Social_Links", ["user_id"], name: "user_id", using: :btree

  create_table "User", primary_key: "user_id", force: :cascade do |t|
    t.string "first_name", limit: 25,  null: false
    t.string "last_name",  limit: 25,  null: false
    t.string "password",   limit: 35,  null: false
    t.string "email_id",   limit: 50,  null: false
    t.date   "dob"
    t.string "picture",    limit: 20
    t.string "street",     limit: 100
    t.string "city",       limit: 100
    t.string "state",      limit: 2
    t.string "country",    limit: 3
    t.string "zip",        limit: 10
    t.string "sex",        limit: 1
  end

  create_table "connections", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "doctors", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "Connections", "User", column: "friend_id", primary_key: "user_id", name: "Connections_ibfk_2"
  add_foreign_key "Connections", "User", column: "user_id", primary_key: "user_id", name: "Connections_ibfk_1"
  add_foreign_key "Device", "Company", column: "company_id", primary_key: "company_id", name: "Device_ibfk_1"
  add_foreign_key "Devices_Owned", "Device", column: "dev_id", primary_key: "dev_id", name: "Devices_Owned_ibfk_2"
  add_foreign_key "Devices_Owned", "Hospital", column: "hospital_id", primary_key: "hospital_id", name: "Devices_Owned_ibfk_1"
  add_foreign_key "Doctor", "User", column: "doctor_id", primary_key: "user_id", name: "Doctor_ibfk_1"
  add_foreign_key "Doctor_Workplace", "Hospital", column: "hospital_id", primary_key: "hospital_id", name: "Doctor_Workplace_ibfk_2"
  add_foreign_key "Doctor_Workplace", "User", column: "user_id", primary_key: "user_id", name: "Doctor_Workplace_ibfk_1"
  add_foreign_key "Document", "User", column: "user_id", primary_key: "user_id", name: "Document_ibfk_1"
  add_foreign_key "Document_Folder", "Document", column: "document_id", primary_key: "document_id", name: "Document_Folder_ibfk_2"
  add_foreign_key "Document_Folder", "Folder", column: "folder_id", primary_key: "folder_id", name: "Document_Folder_ibfk_1"
  add_foreign_key "Folder", "User", column: "user_id", primary_key: "user_id", name: "Folder_ibfk_1"
  add_foreign_key "Representative", "Company", column: "company_id", primary_key: "company_id", name: "Representative_ibfk_2"
  add_foreign_key "Representative", "User", column: "rep_id", primary_key: "user_id", name: "Representative_ibfk_1"
  add_foreign_key "Share_Document", "Document", column: "document_id", primary_key: "document_id", name: "Share_Document_ibfk_1"
  add_foreign_key "Share_Document", "User", column: "user_id", primary_key: "user_id", name: "Share_Document_ibfk_2"
  add_foreign_key "Social_Links", "User", column: "user_id", primary_key: "user_id", name: "Social_Links_ibfk_1"
end
