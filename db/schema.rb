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

ActiveRecord::Schema.define(version: 2019_03_12_114848) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "events", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "start_date"
    t.integer "duration"
    t.string "spectator_price"
    t.text "rules"
    t.string "prize_money"
    t.string "picture_url"
    t.bigint "locality_id"
    t.bigint "promoter_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["locality_id"], name: "index_events_on_locality_id"
    t.index ["promoter_id"], name: "index_events_on_promoter_id"
  end

  create_table "registrations", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "event_id"
    t.string "role"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_id"], name: "index_registrations_on_event_id"
    t.index ["user_id"], name: "index_registrations_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "nick_name"
    t.string "avatar_url"
    t.string "phone"
    t.boolean "is_god", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
