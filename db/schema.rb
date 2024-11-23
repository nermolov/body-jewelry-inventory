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

ActiveRecord::Schema[8.0].define(version: 2024_11_22_234922) do
  create_table "attributes_captive_bead_rings", force: :cascade do |t|
    t.float "gauge"
    t.float "ring_diameter"
    t.float "bead_diameter"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "attributes_chains", force: :cascade do |t|
    t.float "length"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "attributes_circular_barbells", force: :cascade do |t|
    t.float "gauge"
    t.float "diameter"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "attributes_curved_barbells", force: :cascade do |t|
    t.float "gauge"
    t.float "length"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "attributes_labret_posts", force: :cascade do |t|
    t.float "gauge"
    t.float "length"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "attributes_plugs", force: :cascade do |t|
    t.float "gauge"
    t.float "length"
    t.boolean "double_flared"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "attributes_threaded_ends", force: :cascade do |t|
    t.float "gauge"
    t.float "diameter"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "attributes_threadless_ends", force: :cascade do |t|
    t.float "gauge"
    t.float "diameter"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "brands", force: :cascade do |t|
    t.string "name"
    t.string "website_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "jewelries", force: :cascade do |t|
    t.string "name"
    t.integer "brand_id", null: false
    t.integer "studio_id", null: false
    t.integer "location_id", null: false
    t.integer "material_id", null: false
    t.string "jewelry_attributes_type", null: false
    t.integer "jewelry_attributes_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["brand_id"], name: "index_jewelries_on_brand_id"
    t.index ["jewelry_attributes_type", "jewelry_attributes_id"], name: "index_jewelries_on_jewelry_attributes"
    t.index ["location_id"], name: "index_jewelries_on_location_id"
    t.index ["material_id"], name: "index_jewelries_on_material_id"
    t.index ["studio_id"], name: "index_jewelries_on_studio_id"
  end

  create_table "locations", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "materials", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "studios", force: :cascade do |t|
    t.string "name"
    t.text "address"
    t.string "website_url"
    t.string "phone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "jewelries", "brands"
  add_foreign_key "jewelries", "locations"
  add_foreign_key "jewelries", "materials"
  add_foreign_key "jewelries", "studios"
end
