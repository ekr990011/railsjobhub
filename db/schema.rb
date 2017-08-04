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

ActiveRecord::Schema.define(version: 20170731182608) do

  create_table "careerbuilders", force: :cascade do |t|
    t.string   "job_title"
    t.text     "job_description"
    t.string   "job_link"
    t.string   "job_date"
    t.string   "job_company"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "contacts", force: :cascade do |t|
    t.string   "email"
    t.string   "name"
    t.text     "text"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "contracts", force: :cascade do |t|
    t.string   "title"
    t.string   "email"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.date     "expiration"
  end

  create_table "cybercoders", force: :cascade do |t|
    t.string   "job_link"
    t.string   "job_title"
    t.string   "job_location"
    t.string   "job_wage"
    t.string   "job_time"
    t.string   "job_skill_array"
    t.text     "job_description"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

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

  create_table "githubs", force: :cascade do |t|
    t.string   "job_title"
    t.string   "job_link"
    t.string   "job_description"
    t.string   "job_apply"
    t.string   "job_company"
    t.string   "job_location"
    t.date     "job_date"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "indeed_rails", force: :cascade do |t|
    t.string   "jobtitle"
    t.string   "company"
    t.string   "city"
    t.string   "state"
    t.string   "country"
    t.string   "source"
    t.string   "date"
    t.string   "link"
    t.text     "snippet"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "jobs", force: :cascade do |t|
    t.string   "title"
    t.string   "email"
    t.text     "description"
    t.string   "logo"
    t.date     "expiration"
    t.string   "applyinfo"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "remotelyawesomes", force: :cascade do |t|
    t.string   "job_link"
    t.string   "job_skills"
    t.string   "job_title"
    t.string   "job_company"
    t.text     "job_description"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "stack_jobs", force: :cascade do |t|
    t.string   "title"
    t.string   "link"
    t.string   "company"
    t.string   "skills"
    t.string   "date_posted"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.text     "description"
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
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.text     "descriptionlong"
  end

end
