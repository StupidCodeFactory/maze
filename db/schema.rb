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

ActiveRecord::Schema.define(version: 20160314013748) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "maze_boards", force: :cascade do |t|
    t.integer  "start_x"
    t.integer  "start_y"
    t.integer  "end_x"
    t.integer  "end_y"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "maze_cells", force: :cascade do |t|
    t.integer  "x",                                   null: false
    t.integer  "y",                                   null: false
    t.integer  "walls",         limit: 2, default: 0, null: false
    t.integer  "maze_board_id",                       null: false
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

end
