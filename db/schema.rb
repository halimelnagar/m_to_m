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

ActiveRecord::Schema.define(version: 20171120210249) do

  create_table "Phases_Projects", id: false, force: :cascade do |t|
    t.integer "phase_id",   null: false
    t.integer "project_id", null: false
  end

  create_table "Systems_Teams", id: false, force: :cascade do |t|
    t.integer "system_id", null: false
    t.integer "team_id",   null: false
  end

  create_table "complexities", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "impacted_systems", force: :cascade do |t|
    t.integer "project_id"
    t.integer "system_id"
  end

  create_table "phase_levels", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "phases", force: :cascade do |t|
    t.string   "name"
    t.integer  "sequence"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.integer  "phase_level_id"
  end

  add_index "phases", ["phase_level_id"], name: "index_phases_on_phase_level_id"

  create_table "priorities", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "projects", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "smo_id"
    t.integer  "type_id"
    t.integer  "complexity_id"
    t.integer  "priority_id"
  end

  add_index "projects", ["complexity_id"], name: "index_projects_on_complexity_id"
  add_index "projects", ["priority_id"], name: "index_projects_on_priority_id"
  add_index "projects", ["smo_id"], name: "index_projects_on_smo_id", unique: true
  add_index "projects", ["type_id"], name: "index_projects_on_type_id"

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
    t.integer "project_id"
    t.integer "System_id"
    t.integer "phase_id"
  end

  add_index "tasks", ["System_id"], name: "index_tasks_on_System_id"
  add_index "tasks", ["phase_id"], name: "index_tasks_on_phase_id"
  add_index "tasks", ["project_id"], name: "index_tasks_on_project_id"
  add_index "tasks", ["system_team_phase_id"], name: "index_tasks_on_system_team_phase_id"

  create_table "teams", force: :cascade do |t|
    t.string   "name"
    t.integer  "spoc_id"
    t.string   "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "teams", ["email"], name: "index_teams_on_email", unique: true

  create_table "types", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
