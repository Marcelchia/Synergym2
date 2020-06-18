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

ActiveRecord::Schema.define(version: 2020_06_12_132935) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "meal_categories", force: :cascade do |t|
    t.string "description"
  end

  create_table "meals", force: :cascade do |t|
    t.string "description"
    t.bigint "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "meal_category_id"
    t.date "date"
    t.integer "calories"
    t.index ["meal_category_id"], name: "index_meals_on_meal_category_id"
    t.index ["user_id"], name: "index_meals_on_user_id"
  end

  create_table "tip_categories", force: :cascade do |t|
    t.string "description"
  end

  create_table "tips", force: :cascade do |t|
    t.string "description"
    t.bigint "user_id"
    t.index ["user_id"], name: "index_tips_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.decimal "height", precision: 50, scale: 2
    t.decimal "weight", precision: 50, scale: 1
    t.string "name"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "workout_categories", force: :cascade do |t|
    t.string "description"
  end

  create_table "workouts", force: :cascade do |t|
    t.string "description"
    t.bigint "user_id"
    t.date "date"
    t.bigint "workout_category_id"
    t.index ["user_id"], name: "index_workouts_on_user_id"
    t.index ["workout_category_id"], name: "index_workouts_on_workout_category_id"
  end

  add_foreign_key "meals", "meal_categories"
  add_foreign_key "workouts", "workout_categories"
end