# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2022_12_07_084108) do
  create_table "car_catalog_cars", force: :cascade do |t|
    t.string "registration_number"
    t.string "color"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "customers_orm_driven_customers", force: :cascade do |t|
    t.string "phone"
    t.string "email"
    t.string "name"
    t.string "city"
    t.string "street"
    t.date "birthday"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "customers_orm_driven_rates", force: :cascade do |t|
    t.integer "customer_id"
    t.integer "rated_customer_id"
    t.integer "mark"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["customer_id"], name: "index_customers_orm_driven_rates_on_customer_id"
    t.index ["rated_customer_id"], name: "index_customers_orm_driven_rates_on_rated_customer_id"
  end

  create_table "customers_with_person_model_customers", force: :cascade do |t|
    t.string "phone"
    t.string "city"
    t.string "street"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "customers_with_person_model_persons", force: :cascade do |t|
    t.string "email"
    t.string "name"
    t.date "birthday"
    t.integer "customer_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "customers_with_person_model_rates", force: :cascade do |t|
    t.integer "customer_id"
    t.integer "rated_customer_id"
    t.integer "mark"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["customer_id"], name: "index_customers_with_person_model_rates_on_customer_id"
    t.index ["rated_customer_id"], name: "index_customers_with_person_model_rates_on_rated_customer_id"
  end

  create_table "customers_with_vo_and_identity_and_behavior_customers", force: :cascade do |t|
    t.string "phone"
    t.string "email"
    t.string "name"
    t.string "city"
    t.string "street"
    t.date "birthday"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "customers_with_vo_and_identity_and_behavior_rates", force: :cascade do |t|
    t.integer "customer_id"
    t.integer "rated_customer_id"
    t.integer "mark"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["customer_id"], name: "index_customers_with_vo_and_identity_and_behavior_rates_c_id"
    t.index ["rated_customer_id"], name: "index_customers_with_vo_and_identity_and_behavior_rates_oc_id"
  end

  create_table "customers_with_vo_customers", force: :cascade do |t|
    t.string "phone"
    t.string "email"
    t.string "name"
    t.string "city"
    t.string "street"
    t.date "birthday"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "customers_with_vo_rates", force: :cascade do |t|
    t.integer "customer_id"
    t.integer "rated_customer_id"
    t.integer "mark"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["customer_id"], name: "index_customers_with_vo_rates_on_customer_id"
    t.index ["rated_customer_id"], name: "index_customers_with_vo_rates_on_rated_customer_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "customers_orm_driven_rates", "customers_orm_driven_customers", column: "rated_customer_id"
  add_foreign_key "customers_with_person_model_rates", "customers_with_person_model_customers", column: "rated_customer_id"
  add_foreign_key "customers_with_vo_and_identity_and_behavior_rates", "customers_with_vo_and_identity_and_behavior_customers", column: "rated_customer_id"
  add_foreign_key "customers_with_vo_rates", "customers_with_vo_customers", column: "rated_customer_id"
end
