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

ActiveRecord::Schema.define(version: 2019_04_09_023656) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "careerbuilders", id: :serial, force: :cascade do |t|
    t.string "job_title"
    t.text "job_description"
    t.string "job_link"
    t.string "job_date"
    t.string "job_company"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "contacts", id: :serial, force: :cascade do |t|
    t.string "email"
    t.string "name"
    t.text "text"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "contracts", id: :serial, force: :cascade do |t|
    t.string "title"
    t.string "email"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.date "expiration"
  end

  create_table "cybercoders", id: :serial, force: :cascade do |t|
    t.string "job_link"
    t.string "job_title"
    t.string "job_location"
    t.string "job_wage"
    t.string "job_time"
    t.string "job_skill_array"
    t.text "job_description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "freelancerails", id: :serial, force: :cascade do |t|
    t.string "title"
    t.string "href"
    t.text "description"
    t.string "bids"
    t.string "skills"
    t.string "budget"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "date"
  end

  create_table "freelancescrapes", id: :serial, force: :cascade do |t|
    t.string "title"
    t.string "href"
    t.text "description"
    t.string "bids"
    t.string "skills"
    t.string "budget"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "date"
  end

  create_table "githubs", id: :serial, force: :cascade do |t|
    t.string "job_title"
    t.string "job_link"
    t.string "job_description"
    t.string "job_apply"
    t.string "job_company"
    t.string "job_location"
    t.date "job_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "indeed_rails", id: :serial, force: :cascade do |t|
    t.string "jobtitle"
    t.string "company"
    t.string "city"
    t.string "state"
    t.string "country"
    t.string "source"
    t.string "date"
    t.string "link"
    t.text "snippet"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "jobs", id: :serial, force: :cascade do |t|
    t.string "title"
    t.string "email"
    t.text "description"
    t.string "logo"
    t.date "expiration"
    t.string "applyinfo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "remotelyawesomes", id: :serial, force: :cascade do |t|
    t.string "job_link"
    t.string "job_skills"
    t.string "job_title"
    t.string "job_company"
    t.text "job_description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "scrapes", force: :cascade do |t|
    t.string "job_id"
    t.string "title"
    t.string "link"
    t.datetime "date"
    t.string "company"
    t.string "location"
    t.string "source"
    t.string "skills", array: true
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["date"], name: "index_scrapes_on_date"
  end

  create_table "stack_jobs", id: :serial, force: :cascade do |t|
    t.string "title"
    t.string "link"
    t.string "company"
    t.string "skills"
    t.string "date_posted"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "description"
  end

  create_table "upwork_rails", id: :serial, force: :cascade do |t|
    t.string "title"
    t.string "href"
    t.text "description"
    t.string "date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "upwork_rubies", id: :serial, force: :cascade do |t|
    t.string "title"
    t.string "href"
    t.text "description"
    t.string "date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "upwork_scrapes", id: :serial, force: :cascade do |t|
    t.string "title"
    t.string "href"
    t.text "description"
    t.string "date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "wework_rails", id: :serial, force: :cascade do |t|
    t.string "company"
    t.string "description"
    t.string "date"
    t.string "link"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "descriptionlong"
  end

end
