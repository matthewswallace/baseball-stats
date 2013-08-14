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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130813003817) do

  create_table "batting_avarages", :force => true do |t|
    t.integer  "user_id"
    t.integer  "yearID"
    t.string   "teamID"
    t.integer  "G"
    t.integer  "AB"
    t.integer  "R"
    t.integer  "H"
    t.integer  "TWOB"
    t.integer  "TREEB"
    t.integer  "HR"
    t.integer  "RBI"
    t.integer  "SB"
    t.integer  "CS"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "batting_averages", :force => true do |t|
    t.integer  "TWOB"
    t.integer  "TREEB"
    t.integer  "AB"
    t.integer  "CS"
    t.integer  "G"
    t.integer  "H"
    t.integer  "HR"
    t.integer  "R"
    t.integer  "RBI"
    t.integer  "SB"
    t.string   "teamID"
    t.integer  "user_id"
    t.integer  "yearID"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "players", :force => true do |t|
    t.string   "nameFirst"
    t.string   "nameLast"
    t.string   "birthYear"
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "playerId"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

end
