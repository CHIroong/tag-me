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

ActiveRecord::Schema.define(version: 20180805093234) do

  create_table "pieces", force: :cascade do |t|
    t.integer "left"
    t.integer "top"
    t.integer "width"
    t.integer "height"
    t.integer "screenshot_id"
    t.integer "type_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["screenshot_id"], name: "index_pieces_on_screenshot_id"
    t.index ["type_id"], name: "index_pieces_on_type_id"
  end

  create_table "screenshots", force: :cascade do |t|
    t.boolean "isFinished"
    t.string "assignee"
    t.string "image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "types", force: :cascade do |t|
    t.string "name"
    t.string "color"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
