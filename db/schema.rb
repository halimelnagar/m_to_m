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

ActiveRecord::Schema.define(version: 20171109142004) do

  create_table "Phases_Projects", id: false, force: :cascade do |t|
    t.integer "phase_id",   null: false
    t.integer "project_id", null: false
  end

  create_table "Systems_Teams", id: false, force: :cascade do |t|
    t.integer "system_id", null: false
    t.integer "team_id",   null: false
  end

  create_table "impacted_systems", force: :cascade do |t|
    t.integer "project_id"
    t.integer "system_id"
  end

  create_table "phases", force: :cascade do |t|
    t.string   "name"
    t.integer  "sequence"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "project_phases", force: :cascade do |t|
    t.integer  "project_id"
    t.integer  "phase_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "project_phases", ["phase_id"], name: "index_project_phases_on_phase_id"
  add_index "project_phases", ["project_id"], name: "index_project_phases_on_project_id"

  create_table "projects", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "system_team_phases", force: :cascade do |t|
    t.integer  "system_id"
    t.integer  "team_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "phase_id"
  end

  add_index "system_team_phases", ["system_id"], name: "index_system_team_phases_on_system_id"
  add_index "system_team_phases", ["team_id"], name: "index_system_team_phases_on_team_id"

  create_table "systems", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tasks", force: :cascade do |t|
    t.string  "name"
    t.integer "impacted_system_id"
    t.boolean "status"
    t.integer "system_team_phase_id"
  end

  add_index "tasks", ["system_team_phase_id"], name: "index_tasks_on_system_team_phase_id"

  create_table "teams", force: :cascade do |t|
    t.string   "name"
    t.integer  "spoc_id"
    t.string   "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "teams", ["email"], name: "index_teams_on_email", unique: true

end
