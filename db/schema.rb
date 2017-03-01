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

ActiveRecord::Schema.define(version: 20170301190423) do

  create_table "freelancerails", force: :cascade do |t|
    t.string   "title"
    t.string   "href"
    t.text     "description"
    t.string   "bids"
    t.string   "skills"
    t.string   "date_start"
    t.string   "date_finish"
    t.string   "budget"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "freelancers", force: :cascade do |t|
    t.string   "title"
    t.string   "href"
    t.text     "description"
    t.string   "bids"
    t.string   "skills"
    t.string   "date_start"
    t.string   "date_finish"
    t.string   "budget"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "freelancescrapes", force: :cascade do |t|
    t.string   "title"
    t.string   "href"
    t.text     "description"
    t.string   "bids"
    t.string   "skills"
    t.string   "date_start"
    t.string   "date_finish"
    t.string   "budget"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "upwork_rails", force: :cascade do |t|
    t.string   "title"
    t.string   "href"
    t.text     "description"
    t.string   "date"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "upwork_rubies", force: :cascade do |t|
    t.string   "title"
    t.string   "href"
    t.text     "description"
    t.string   "date"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "upwork_scrapes", force: :cascade do |t|
    t.string   "title"
    t.string   "href"
    t.text     "description"
    t.string   "date"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "wework_rails", force: :cascade do |t|
    t.string   "company"
    t.string   "description"
    t.string   "date"
    t.string   "link"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

end
