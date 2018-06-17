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

ActiveRecord::Schema.define(version: 2018_06_17_060249) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "drill_groups", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.string "difficulty"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_drill_groups_on_user_id"
  end

  create_table "drills", force: :cascade do |t|
    t.string "title"
    t.string "description"
    t.integer "taken"
    t.bigint "drill_group_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["drill_group_id"], name: "index_drills_on_drill_group_id"
  end

  create_table "questions", force: :cascade do |t|
    t.string "body"
    t.string "answer"
    t.string "options"
    t.string "point"
    t.bigint "drill_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["drill_id"], name: "index_questions_on_drill_id"
  end

  create_table "takes", force: :cascade do |t|
    t.bigint "drill_group_id"
    t.bigint "user_id"
    t.integer "taken_time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["drill_group_id"], name: "index_takes_on_drill_group_id"
    t.index ["user_id"], name: "index_takes_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "last_name"
    t.string "first_name"
    t.string "email"
    t.string "password_digest"
    t.boolean "admin"
    t.boolean "approved_student"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "score"
  end

  add_foreign_key "drill_groups", "users"
  add_foreign_key "drills", "drill_groups"
  add_foreign_key "questions", "drills"
  add_foreign_key "takes", "drill_groups"
  add_foreign_key "takes", "users"
end
