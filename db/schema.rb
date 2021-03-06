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

ActiveRecord::Schema.define(version: 20161010122724) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "family_members", force: :cascade do |t|
    t.string  "first_name"
    t.string  "last_name"
    t.date    "birthdate"
    t.integer "relationship_id"
    t.index ["relationship_id"], name: "index_family_members_on_relationship_id", using: :btree
  end

  create_table "occasions", force: :cascade do |t|
    t.string  "name"
    t.integer "year"
  end

  create_table "presents", force: :cascade do |t|
    t.string  "name"
    t.string  "link"
    t.decimal "price"
    t.integer "quantity"
  end

  create_table "purchased_presents", force: :cascade do |t|
    t.integer "family_member_id"
    t.integer "present_id"
    t.integer "occasion_id"
    t.index ["family_member_id"], name: "index_purchased_presents_on_family_member_id", using: :btree
    t.index ["occasion_id"], name: "index_purchased_presents_on_occasion_id", using: :btree
    t.index ["present_id"], name: "index_purchased_presents_on_present_id", using: :btree
  end

  create_table "relationships", force: :cascade do |t|
    t.string "rel_type"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_foreign_key "family_members", "relationships"
  add_foreign_key "purchased_presents", "family_members"
  add_foreign_key "purchased_presents", "occasions"
  add_foreign_key "purchased_presents", "presents"
end
