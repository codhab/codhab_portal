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

ActiveRecord::Schema.define(version: 20200630194127) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "dblink"
  enable_extension "unaccent"
  enable_extension "uuid-ossp"

  create_table "action_atuation_areas", force: :cascade do |t|
    t.string   "name"
    t.boolean  "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "action_atuation_areas", force: :cascade do |t|
    t.string   "name"
    t.boolean  "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "action_cadastres", force: :cascade do |t|
    t.string   "name"
    t.string   "cpf"
    t.string   "address"
    t.string   "nationality"
    t.string   "password"
    t.string   "email"
    t.string   "phone"
    t.date     "born"
    t.integer  "city_id"
    t.integer  "state_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.integer  "profession_id"
    t.integer  "formation_area_id"
    t.integer  "atuation_area_id"
    t.index ["atuation_area_id"], name: "index_action_cadastres_on_atuation_area_id", using: :btree
    t.index ["atuation_area_id"], name: "index_action_cadastres_on_atuation_area_id", using: :btree
    t.index ["city_id"], name: "index_action_cadastres_on_city_id", using: :btree
    t.index ["city_id"], name: "index_action_cadastres_on_city_id", using: :btree
    t.index ["formation_area_id"], name: "index_action_cadastres_on_formation_area_id", using: :btree
    t.index ["formation_area_id"], name: "index_action_cadastres_on_formation_area_id", using: :btree
    t.index ["profession_id"], name: "index_action_cadastres_on_profession_id", using: :btree
    t.index ["profession_id"], name: "index_action_cadastres_on_profession_id", using: :btree
    t.index ["state_id"], name: "index_action_cadastres_on_state_id", using: :btree
    t.index ["state_id"], name: "index_action_cadastres_on_state_id", using: :btree
  end

  create_table "action_cadastres", force: :cascade do |t|
    t.string   "name"
    t.string   "cpf"
    t.string   "address"
    t.string   "nationality"
    t.string   "password"
    t.string   "email"
    t.string   "phone"
    t.date     "born"
    t.integer  "city_id"
    t.integer  "state_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.integer  "profession_id"
    t.integer  "formation_area_id"
    t.integer  "atuation_area_id"
    t.index ["atuation_area_id"], name: "index_action_cadastres_on_atuation_area_id", using: :btree
    t.index ["atuation_area_id"], name: "index_action_cadastres_on_atuation_area_id", using: :btree
    t.index ["city_id"], name: "index_action_cadastres_on_city_id", using: :btree
    t.index ["city_id"], name: "index_action_cadastres_on_city_id", using: :btree
    t.index ["formation_area_id"], name: "index_action_cadastres_on_formation_area_id", using: :btree
    t.index ["formation_area_id"], name: "index_action_cadastres_on_formation_area_id", using: :btree
    t.index ["profession_id"], name: "index_action_cadastres_on_profession_id", using: :btree
    t.index ["profession_id"], name: "index_action_cadastres_on_profession_id", using: :btree
    t.index ["state_id"], name: "index_action_cadastres_on_state_id", using: :btree
    t.index ["state_id"], name: "index_action_cadastres_on_state_id", using: :btree
  end

  create_table "action_formation_areas", force: :cascade do |t|
    t.string   "name"
    t.boolean  "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "action_formation_areas", force: :cascade do |t|
    t.string   "name"
    t.boolean  "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "action_general_links", force: :cascade do |t|
    t.string   "name"
    t.string   "file_link"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "action_inscriptions", force: :cascade do |t|
    t.integer  "social_event_id"
    t.integer  "cadastre_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["cadastre_id"], name: "index_action_inscriptions_on_cadastre_id", using: :btree
    t.index ["cadastre_id"], name: "index_action_inscriptions_on_cadastre_id", using: :btree
    t.index ["social_event_id"], name: "index_action_inscriptions_on_social_event_id", using: :btree
    t.index ["social_event_id"], name: "index_action_inscriptions_on_social_event_id", using: :btree
  end

  create_table "action_inscriptions", force: :cascade do |t|
    t.integer  "social_event_id"
    t.integer  "cadastre_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["cadastre_id"], name: "index_action_inscriptions_on_cadastre_id", using: :btree
    t.index ["cadastre_id"], name: "index_action_inscriptions_on_cadastre_id", using: :btree
    t.index ["social_event_id"], name: "index_action_inscriptions_on_social_event_id", using: :btree
    t.index ["social_event_id"], name: "index_action_inscriptions_on_social_event_id", using: :btree
  end

  create_table "action_professions", force: :cascade do |t|
    t.string   "name"
    t.boolean  "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "action_professions", force: :cascade do |t|
    t.string   "name"
    t.boolean  "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "action_social_events", force: :cascade do |t|
    t.string   "name"
    t.date     "date"
    t.text     "description"
    t.integer  "situation"
    t.integer  "localization_id"
    t.integer  "city_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.boolean  "status"
    t.string   "photo"
    t.string   "thumb"
    t.string   "hour"
    t.string   "district"
    t.string   "report"
    t.string   "numacao"
    t.index ["city_id"], name: "index_action_social_events_on_city_id", using: :btree
    t.index ["city_id"], name: "index_action_social_events_on_city_id", using: :btree
    t.index ["localization_id"], name: "index_action_social_events_on_localization_id", using: :btree
    t.index ["localization_id"], name: "index_action_social_events_on_localization_id", using: :btree
  end

  create_table "action_social_events", force: :cascade do |t|
    t.string   "name"
    t.date     "date"
    t.text     "description"
    t.integer  "situation"
    t.integer  "localization_id"
    t.integer  "city_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.boolean  "status"
    t.string   "photo"
    t.string   "thumb"
    t.string   "hour"
    t.string   "district"
    t.string   "report"
    t.string   "numacao"
    t.index ["city_id"], name: "index_action_social_events_on_city_id", using: :btree
    t.index ["city_id"], name: "index_action_social_events_on_city_id", using: :btree
    t.index ["localization_id"], name: "index_action_social_events_on_localization_id", using: :btree
    t.index ["localization_id"], name: "index_action_social_events_on_localization_id", using: :btree
  end

  create_table "action_team_links", force: :cascade do |t|
    t.string   "name"
    t.string   "file_link"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "action_yearly_links", force: :cascade do |t|
    t.string   "name"
    t.string   "file_link"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "address_activities", force: :cascade do |t|
    t.text     "observation"
    t.integer  "unit_id"
    t.integer  "staff_id"
    t.integer  "activity_status_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.index ["activity_status_id"], name: "index_address_activities_on_activity_status_id", using: :btree
    t.index ["staff_id"], name: "index_address_activities_on_staff_id", using: :btree
    t.index ["unit_id"], name: "index_address_activities_on_unit_id", using: :btree
  end

  create_table "address_activity_statuses", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.boolean  "status"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "address_allotment_types", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.boolean  "status"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.string   "main_signature"
    t.string   "main_cpf"
    t.string   "first_attestant_signature"
    t.string   "first_attestant_cpf"
    t.string   "second_attestant_signature"
    t.string   "second_attestant_cpf"
  end

  create_table "address_burghs", force: :cascade do |t|
    t.string   "name"
    t.integer  "city_id"
    t.boolean  "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "address_check_allotments", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.date     "date"
    t.integer  "situation_id", default: 0
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "address_check_images", force: :cascade do |t|
    t.integer  "check_id"
    t.string   "image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "address_check_units", force: :cascade do |t|
    t.date     "date"
    t.string   "address"
    t.string   "number"
    t.string   "name"
    t.string   "cpf"
    t.string   "rg"
    t.string   "spouse_name"
    t.string   "spouse_cpf"
    t.string   "spouse_rg"
    t.string   "telephone"
    t.string   "city"
    t.string   "process"
    t.string   "number_dependent"
    t.integer  "unit_situation_one"
    t.integer  "unit_situation_two"
    t.integer  "unit_situation_three"
    t.integer  "unit_situation_four"
    t.string   "unit_ocupation_time"
    t.integer  "address_detail_one"
    t.integer  "address_detail_observation"
    t.integer  "address_detail_two"
    t.integer  "address_detail_three"
    t.boolean  "address_detail_four",        default: false
    t.boolean  "address_detail_five",        default: false
    t.integer  "count_room"
    t.integer  "count_resident"
    t.string   "address_ocupation_time"
    t.integer  "staff_id"
    t.text     "observation"
    t.datetime "created_at",                                 null: false
    t.datetime "updated_at",                                 null: false
    t.integer  "allotment_id"
    t.string   "block"
    t.string   "group"
    t.integer  "gender"
    t.date     "born"
    t.string   "nationality"
    t.boolean  "work"
    t.string   "df_time"
    t.boolean  "closed"
  end

  create_table "address_checks", force: :cascade do |t|
    t.integer  "cadastre_id"
    t.string   "name"
    t.string   "cpf"
    t.date     "born"
    t.string   "telephone"
    t.string   "telephone_optional"
    t.string   "celphone"
    t.string   "password"
    t.string   "check_unit_id"
    t.text     "observation"
    t.string   "lat"
    t.string   "lng"
    t.integer  "situation_id",       default: 0
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
  end

  create_table "address_cities", force: :cascade do |t|
    t.string   "name"
    t.boolean  "capital",          default: true
    t.integer  "state_id"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.integer  "region_id"
    t.integer  "entity_region_id"
    t.string   "lat"
    t.string   "lng"
    t.index ["state_id"], name: "index_address_cities_on_state_id", using: :btree
  end

  create_table "address_city_booking_documents", force: :cascade do |t|
    t.string   "name"
    t.string   "file"
    t.integer  "city_booking_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "address_city_bookings", force: :cascade do |t|
    t.string   "name"
    t.string   "cpf"
    t.string   "address"
    t.integer  "type_one",   default: 0
    t.integer  "type_two",   default: 0
    t.boolean  "type_three", default: true
    t.date     "date"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.string   "location"
    t.boolean  "delivered",  default: false
  end

  create_table "address_elonets", force: :cascade do |t|
    t.integer "nucleus"
    t.string  "contract"
    t.string  "process"
    t.string  "cpf"
    t.string  "name"
    t.string  "address"
    t.string  "burgh"
    t.string  "city"
    t.string  "date"
    t.string  "charter"
    t.string  "contract_situation"
  end

  create_table "address_juridical_types", force: :cascade do |t|
    t.string   "name"
    t.boolean  "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "address_labels", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.boolean  "status"
    t.integer  "staff_id"
    t.string   "color"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "address_notary_offices", force: :cascade do |t|
    t.string   "unit_code"
    t.string   "office"
    t.date     "date_code"
    t.date     "date_contract"
    t.string   "code_contract"
    t.string   "office_contract"
    t.date     "date_petition"
    t.date     "date_signature"
    t.date     "date_anoreg"
    t.date     "date_devolution"
    t.string   "requeriment"
    t.date     "date_requeriment"
    t.string   "declaratory_act_number"
    t.string   "rejection_number"
    t.integer  "unit_id"
    t.date     "date_act_declaratory"
    t.date     "date_act_rejection"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.string   "endorsement"
    t.index ["unit_id"], name: "index_address_notary_offices_on_unit_id", using: :btree
  end

  create_table "address_owner_types", force: :cascade do |t|
    t.string   "name"
    t.boolean  "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "address_ownership_types", force: :cascade do |t|
    t.string   "name"
    t.string   "descritpion"
    t.boolean  "status"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "address_print_allotments", force: :cascade do |t|
    t.integer  "staff_id"
    t.boolean  "status"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "print_type_id"
    t.index ["staff_id"], name: "index_address_print_allotments_on_staff_id", using: :btree
  end

  create_table "address_print_types", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.string   "main_signature"
    t.string   "main_cpf"
    t.string   "first_attestant_signature"
    t.string   "first_attestant_cpf"
    t.string   "second_attestant_signature"
    t.string   "second_attestant_cpf"
    t.boolean  "status"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "address_print_unit_cadastres", force: :cascade do |t|
    t.string   "cpf"
    t.integer  "cadastre_id"
    t.integer  "unit_id"
    t.integer  "current_unit_id"
    t.boolean  "status"
    t.integer  "print_allotment_id"
    t.text     "message"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.integer  "descriptive_type"
    t.boolean  "cancelled"
    t.string   "occupant_cpf_2"
    t.string   "occupant_id_2"
    t.string   "occupant_cpf_3"
    t.string   "occupant_id_3"
    t.date     "date_doc"
    t.boolean  "married"
    t.index ["cadastre_id"], name: "index_address_print_unit_cadastres_on_cadastre_id", using: :btree
    t.index ["current_unit_id"], name: "index_address_print_unit_cadastres_on_current_unit_id", using: :btree
    t.index ["print_allotment_id"], name: "index_address_print_unit_cadastres_on_print_allotment_id", using: :btree
    t.index ["unit_id"], name: "index_address_print_unit_cadastres_on_unit_id", using: :btree
  end

  create_table "address_recovery_units", force: :cascade do |t|
    t.string   "account"
    t.string   "account_type"
    t.string   "group"
    t.string   "group_complement"
    t.string   "number"
    t.string   "location"
    t.string   "registry"
    t.string   "code"
    t.string   "value"
    t.text     "observation"
    t.string   "situation"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "address_regions", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "address_registry_units", force: :cascade do |t|
    t.integer  "situation"
    t.boolean  "status"
    t.integer  "unit_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["unit_id"], name: "index_address_registry_units_on_unit_id", using: :btree
  end

  create_table "address_sealing_addresses", force: :cascade do |t|
    t.integer  "sub_area_id"
    t.integer  "city_id"
    t.string   "address"
    t.integer  "unit_id"
    t.string   "name"
    t.string   "cpf"
    t.boolean  "status"
    t.string   "lat"
    t.string   "lng"
    t.text     "observation"
    t.integer  "staff_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "address_sealing_areas", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "city_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "address_sealing_documents", force: :cascade do |t|
    t.integer  "address_id"
    t.integer  "area_id"
    t.integer  "sub_area_id"
    t.string   "attachment"
    t.integer  "staff_id"
    t.string   "name"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "address_sealing_sub_areas", force: :cascade do |t|
    t.integer  "area_id"
    t.string   "name"
    t.text     "description"
    t.integer  "sub_area_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "address_situation_units", force: :cascade do |t|
    t.string   "description"
    t.string   "code"
    t.boolean  "status",      default: true
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "address_states", force: :cascade do |t|
    t.string   "name"
    t.string   "acronym"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "address_type_use_units", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.boolean  "status"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "address_unit_images", force: :cascade do |t|
    t.integer  "unit_id"
    t.string   "image"
    t.integer  "staff_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "address_unit_labels", force: :cascade do |t|
    t.integer  "unit_id"
    t.integer  "label_id"
    t.text     "observation"
    t.integer  "staff_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

