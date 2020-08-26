# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_08_26_020309) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "default_skill_measures", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "default_skills_id", null: false
    t.integer "score", default: 0
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["default_skills_id"], name: "index_default_skill_measures_on_default_skills_id"
    t.index ["user_id"], name: "index_default_skill_measures_on_user_id"
  end

  create_table "default_skills", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "user_skill_measures", force: :cascade do |t|
    t.bigint "user_skills_id", null: false
    t.integer "score"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_skills_id"], name: "index_user_skill_measures_on_user_skills_id"
  end

  create_table "user_skills", force: :cascade do |t|
    t.string "name"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_user_skills_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "default_skill_measures", "default_skills", column: "default_skills_id"
  add_foreign_key "default_skill_measures", "users"
  add_foreign_key "user_skill_measures", "user_skills", column: "user_skills_id"
  add_foreign_key "user_skills", "users"
end
