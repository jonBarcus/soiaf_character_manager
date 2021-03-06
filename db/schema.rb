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

ActiveRecord::Schema.define(version: 20140401223257) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "characters", force: true do |t|
    t.string   "name"
    t.integer  "age"
    t.string   "gender"
    t.integer  "house_id",        default: 1
    t.integer  "agility",         default: 2
    t.integer  "animal_handling", default: 2
    t.integer  "athletics",       default: 2
    t.integer  "awareness",       default: 2
    t.integer  "cunning",         default: 2
    t.integer  "deception",       default: 2
    t.integer  "endurance",       default: 2
    t.integer  "fighting",        default: 2
    t.integer  "healing",         default: 2
    t.integer  "language",        default: 2
    t.integer  "knowledge",       default: 2
    t.integer  "marksmanship",    default: 2
    t.integer  "persuasion",      default: 2
    t.integer  "status",          default: 2
    t.integer  "stealth",         default: 2
    t.integer  "survival",        default: 2
    t.integer  "thievery",        default: 2
    t.integer  "warfare",         default: 2
    t.integer  "will",            default: 2
    t.boolean  "is_alive",        default: true
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  create_table "houses", force: true do |t|
    t.string  "name"
    t.integer "region_id"
    t.integer "user_id"
  end

  create_table "regions", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "email"
    t.string   "username"
    t.string   "name"
    t.string   "password_digest"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "is_admin"
  end

end
