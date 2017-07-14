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

ActiveRecord::Schema.define(version: 20170714170729) do

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "constructeurs", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "event_utilisateurs", force: :cascade do |t|
    t.integer  "event_id"
    t.integer  "utilisateur_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["event_id"], name: "index_event_utilisateurs_on_event_id"
    t.index ["utilisateur_id"], name: "index_event_utilisateurs_on_utilisateur_id"
  end

  create_table "events", force: :cascade do |t|
    t.string   "name"
    t.datetime "startDate"
    t.datetime "endDate"
    t.string   "place"
    t.integer  "rate"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.string   "slug"
    t.integer  "status"
    t.float    "latitude"
    t.float    "longitude"
  end

  create_table "modeles", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "constructeur_id"
    t.string   "slug"
    t.index ["constructeur_id"], name: "index_modeles_on_constructeur_id"
  end

  create_table "roles", force: :cascade do |t|
    t.string   "name"
    t.string   "resource_type"
    t.integer  "resource_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["name", "resource_type", "resource_id"], name: "index_roles_on_name_and_resource_type_and_resource_id"
    t.index ["name"], name: "index_roles_on_name"
  end

  create_table "utilisateurs", force: :cascade do |t|
    t.string   "firstName"
    t.string   "lastName"
    t.integer  "numAddress"
    t.string   "address"
    t.string   "city"
    t.string   "phone"
    t.boolean  "isActive"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
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
    t.string   "pseudo"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.string   "slug"
    t.index ["email"], name: "index_utilisateurs_on_email", unique: true
    t.index ["pseudo"], name: "index_utilisateurs_on_pseudo", unique: true
    t.index ["reset_password_token"], name: "index_utilisateurs_on_reset_password_token", unique: true
  end

  create_table "utilisateurs_roles", id: false, force: :cascade do |t|
    t.integer "utilisateur_id"
    t.integer "role_id"
    t.index ["utilisateur_id", "role_id"], name: "index_utilisateurs_roles_on_utilisateur_id_and_role_id"
  end

  create_table "voitures", force: :cascade do |t|
    t.string   "couleur"
    t.string   "description"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.integer  "constructeur_id"
    t.string   "name"
    t.integer  "modele_id"
    t.integer  "utilisateur_id"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.string   "slug"
    t.date     "release"
    t.integer  "categorie_id"
    t.index ["categorie_id"], name: "index_voitures_on_categorie_id"
    t.index ["constructeur_id"], name: "index_voitures_on_constructeur_id"
    t.index ["modele_id"], name: "index_voitures_on_modele_id"
    t.index ["name"], name: "index_voitures_on_name", unique: true
    t.index ["utilisateur_id"], name: "index_voitures_on_utilisateur_id"
  end

  create_table "vroumies", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
