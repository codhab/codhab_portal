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

ActiveRecord::Schema.define(version: 20180906125032) do


  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "dblink"
  enable_extension "unaccent"

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
    t.integer  "address_ocupation_time"
    t.integer  "staff_id"
    t.text     "observation"
    t.datetime "created_at",                                 null: false
    t.datetime "updated_at",                                 null: false
    t.integer  "allotment_id"
    t.string   "block"
    t.string   "group"
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
    t.integer  "address_ocupation_time"
    t.integer  "staff_id"
    t.text     "observation"
    t.datetime "created_at",                                 null: false
    t.datetime "updated_at",                                 null: false
    t.integer  "allotment_id"
    t.string   "block"
    t.string   "group"
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

  create_table "address_units", force: :cascade do |t|
    t.string   "acron_block"
    t.string   "block"
    t.string   "acron_group"
    t.string   "group"
    t.string   "unit"
    t.string   "cep_unit"
    t.string   "area"
    t.string   "complete_address"
    t.string   "burgh"
    t.boolean  "sefaz"
    t.boolean  "donate"
    t.date     "date_donate"
    t.date     "date_iptu"
    t.string   "registration_iptu"
    t.string   "certificate"
    t.integer  "situation_unit_id"
    t.integer  "type_use_unit_id"
    t.integer  "city_id"
    t.integer  "program"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.integer  "project_enterprise_id"
    t.string   "urb"
    t.integer  "control_number"
    t.string   "latlng_block"
    t.string   "latlng_group"
    t.string   "latlng_unit"
    t.string   "latlng_urb"
    t.string   "lat"
    t.string   "lng"
    t.string   "coordinate"
    t.boolean  "contract_delivered"
    t.datetime "contract_delivered_date"
    t.boolean  "no_exemption"
    t.string   "front_area"
    t.string   "back_area"
    t.string   "right_area"
    t.string   "left_area"
    t.string   "limit_front"
    t.string   "limit_back"
    t.string   "limit_right"
    t.string   "limit_left"
    t.string   "acron_unit"
    t.string   "certificate_sefaz"
    t.datetime "date_certificate_sefaz"
    t.datetime "validate_certificate_sefaz"
    t.integer  "enterprise_typology_id"
    t.string   "urbanistic_project"
    t.integer  "ownership_type_id"
    t.date     "delivery_date"
    t.integer  "owner_type_id"
    t.integer  "juridical_type_id"
    t.string   "document_number"
    t.string   "value"
    t.index ["city_id"], name: "index_address_units_on_city_id", using: :btree
    t.index ["project_enterprise_id"], name: "index_address_units_on_project_enterprise_id", using: :btree
    t.index ["situation_unit_id"], name: "index_address_units_on_situation_unit_id", using: :btree
    t.index ["type_use_unit_id"], name: "index_address_units_on_type_use_unit_id", using: :btree
  end

  create_table "address_voi_activities", force: :cascade do |t|
    t.integer  "voi_id"
    t.integer  "activity_type_id"
    t.string   "title"
    t.text     "description"
    t.integer  "staff_id"
    t.date     "date"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "address_voi_activity_types", force: :cascade do |t|
    t.string   "name"
    t.boolean  "status"
    t.integer  "sei_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "address_voi_documents", force: :cascade do |t|
    t.string   "name"
    t.integer  "activity_id"
    t.integer  "voi_id"
    t.integer  "staff_id"
    t.string   "attachment"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "address_voi_origin_types", force: :cascade do |t|
    t.string   "name"
    t.boolean  "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "address_voi_report_reasons", force: :cascade do |t|
    t.string   "name"
    t.boolean  "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "address_voi_schedules", force: :cascade do |t|
    t.integer  "voi_ids",                                 array: true
    t.date     "date"
    t.time     "hour"
    t.string   "name"
    t.text     "description"
    t.text     "resolution"
    t.integer  "staff_id"
    t.boolean  "status",      default: true
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "address_voi_situation_types", force: :cascade do |t|
    t.string   "name"
    t.boolean  "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "address_voi_situations", force: :cascade do |t|
    t.integer  "voi_id"
    t.text     "observation"
    t.integer  "situation_type_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  create_table "address_voi_types", force: :cascade do |t|
    t.string   "name"
    t.boolean  "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "address_vois", force: :cascade do |t|
    t.string   "name"
    t.string   "cpf"
    t.integer  "voi_type_id"
    t.string   "address"
    t.integer  "cadastre_id"
    t.date     "due"
    t.integer  "unit_id"
    t.integer  "origin_type_id"
    t.integer  "report_reason_id"
    t.text     "report"
    t.integer  "city_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.integer  "staff_id"
  end

  create_table "attendance_activities", force: :cascade do |t|
    t.integer  "cadastre_id"
    t.integer  "cadastre_mirror_id"
    t.integer  "activity_situation_id"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.index ["activity_situation_id"], name: "index_attendance_activities_on_activity_situation_id", using: :btree
    t.index ["cadastre_id"], name: "index_attendance_activities_on_cadastre_id", using: :btree
    t.index ["cadastre_mirror_id"], name: "index_attendance_activities_on_cadastre_mirror_id", using: :btree
  end

  create_table "attendance_attendants", force: :cascade do |t|
    t.integer  "service_station_id"
    t.integer  "staff_id"
    t.integer  "privilege",          default: 0
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.boolean  "status"
    t.index ["service_station_id"], name: "index_attendance_attendants_on_service_station_id", using: :btree
    t.index ["staff_id"], name: "index_attendance_attendants_on_staff_id", using: :btree
  end

  create_table "attendance_cadastre_checklists", force: :cascade do |t|
    t.integer  "cadastre_id"
    t.integer  "cadastre_mirror_id"
    t.integer  "checklist_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.index ["cadastre_id"], name: "index_attendance_cadastre_checklists_on_cadastre_id", using: :btree
    t.index ["cadastre_mirror_id"], name: "index_attendance_cadastre_checklists_on_cadastre_mirror_id", using: :btree
    t.index ["checklist_id"], name: "index_attendance_cadastre_checklists_on_checklist_id", using: :btree
  end

  create_table "attendance_cadastres", force: :cascade do |t|
    t.integer  "cadastre_id"
    t.integer  "cadastre_mirror_id"
    t.integer  "situation",                        default: 0
    t.integer  "attendant_id"
    t.integer  "supervisor_id"
    t.datetime "start"
    t.datetime "end"
    t.integer  "program_id"
    t.integer  "service_station_id"
    t.integer  "situation_cadastre",               default: 0
    t.text     "attendant_observation"
    t.text     "supervisor_observation"
    t.string   "supervisor_file"
    t.datetime "created_at",                                   null: false
    t.datetime "updated_at",                                   null: false
    t.text     "checklist_observation"
    t.integer  "convocation_id"
    t.integer  "checklist_type_id"
    t.text     "supervisor_checklist_observation"
    t.index ["cadastre_id"], name: "index_attendance_cadastres_on_cadastre_id", using: :btree
    t.index ["cadastre_mirror_id"], name: "index_attendance_cadastres_on_cadastre_mirror_id", using: :btree
    t.index ["program_id"], name: "index_attendance_cadastres_on_program_id", using: :btree
    t.index ["service_station_id"], name: "index_attendance_cadastres_on_service_station_id", using: :btree
  end

  create_table "attendance_chat_categories", force: :cascade do |t|
    t.string   "name"
    t.boolean  "status",     default: true
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "attendance_chat_comments", force: :cascade do |t|
    t.integer  "chat_id"
    t.text     "content"
    t.boolean  "candidate",               default: true
    t.boolean  "candidate_read",          default: false
    t.integer  "staff_id"
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
    t.datetime "candidate_read_datetime"
  end

  create_table "attendance_chat_uploads", force: :cascade do |t|
    t.integer  "chat_comment_id"
    t.string   "document"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "attendance_chats", force: :cascade do |t|
    t.integer  "chat_category_id"
    t.integer  "cadastre_id"
    t.boolean  "closed",           default: false
    t.text     "close_comment"
    t.boolean  "close_candidate",  default: false
    t.integer  "close_staff_id"
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
  end

  create_table "attendance_checklists", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.integer  "checklist_type", default: 0
    t.boolean  "status",         default: true
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
  end

  create_table "attendance_condition_types", force: :cascade do |t|
    t.string   "name"
    t.boolean  "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "attendance_custom_document_types", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "sei_serial_id"
    t.integer  "prawn_id"
    t.string   "sei_name"
  end

  create_table "attendance_custom_ticket_documents", force: :cascade do |t|
    t.integer  "custom_ticket_id"
    t.integer  "dependent_mirror_id"
    t.integer  "cadastre_mirror_id"
    t.integer  "document_type_id"
    t.string   "attachment"
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
    t.boolean  "sei",                 default: true
  end

  create_table "attendance_custom_ticket_requests", force: :cascade do |t|
    t.integer  "custom_ticket_id"
    t.text     "description"
    t.text     "candidate_response"
    t.boolean  "candidate_read",     default: false
    t.datetime "candidate_read_at"
    t.integer  "attendant_id"
    t.boolean  "closed",             default: false
    t.datetime "closed_at"
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
  end

  create_table "attendance_custom_tickets", force: :cascade do |t|
    t.integer  "cadastre_id"
    t.integer  "cadastre_mirror_id"
    t.boolean  "action_one",             default: false
    t.boolean  "action_two",             default: false
    t.boolean  "action_three",           default: false
    t.boolean  "action_four",            default: false
    t.boolean  "action_five",            default: false
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.boolean  "term_one",               default: false
    t.boolean  "term_two",               default: false
    t.boolean  "term_three",             default: false
    t.integer  "supervisor_id"
    t.boolean  "supervisor",             default: false
    t.datetime "supervisor_date"
    t.text     "supervisor_observation"
    t.integer  "attendant_id"
    t.boolean  "attendant",              default: false
    t.datetime "attendant_date"
    t.text     "attendant_observation"
    t.boolean  "viewr",                  default: false
    t.integer  "viewr_id"
    t.string   "document_number"
    t.boolean  "request",                default: false
    t.string   "document_number_id"
  end

  create_table "attendance_daily_reports", force: :cascade do |t|
    t.string   "name"
    t.boolean  "status"
    t.string   "cpf"
    t.date     "attendance_date"
    t.boolean  "schedule"
    t.integer  "special_condition_id"
    t.integer  "special_condition_type_id"
    t.string   "document_number"
    t.integer  "staff_id"
    t.integer  "station_id"
    t.integer  "report_type_id"
    t.integer  "typology_id"
    t.integer  "attendance_type"
    t.integer  "condition_type_id"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "attendance_form_fields", force: :cascade do |t|
    t.integer  "form_id"
    t.string   "name"
    t.string   "label"
    t.text     "field_collection"
    t.integer  "field_type",           default: 0
    t.integer  "file_max_size",        default: 0
    t.text     "file_white_extension"
    t.string   "field_class"
    t.string   "field_width"
    t.boolean  "required",             default: false
    t.boolean  "unique",               default: false
    t.boolean  "action_after_save",    default: false
    t.text     "function_after_save"
    t.boolean  "allow",                default: true
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
    t.integer  "order_item"
  end

  create_table "attendance_form_values", force: :cascade do |t|
    t.integer  "form_id"
    t.json     "store"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "attendance_forms", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.text     "observation"
    t.boolean  "status",                 default: true
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
    t.string   "reference_model"
    t.string   "reference_field"
    t.string   "reference_return_field"
  end

  create_table "attendance_logs", force: :cascade do |t|
    t.integer  "cadastre_id"
    t.integer  "staff_id"
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["cadastre_id"], name: "index_attendance_logs_on_cadastre_id", using: :btree
    t.index ["staff_id"], name: "index_attendance_logs_on_staff_id", using: :btree
  end

  create_table "attendance_notification_categories", force: :cascade do |t|
    t.string   "name"
    t.text     "default_content"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "attendance_notification_sender_sqls", force: :cascade do |t|
    t.string   "name"
    t.text     "sql"
    t.boolean  "status",     default: true
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "attendance_notification_senders", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "notification_sender_sql_id"
    t.integer  "situation",                  default: 0
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
  end

  create_table "attendance_notification_sends", force: :cascade do |t|
    t.integer  "notification_sender_id"
    t.string   "reference_token"
    t.boolean  "successful",             default: true
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
  end

  create_table "attendance_notifications", force: :cascade do |t|
    t.integer  "cadastre_id"
    t.string   "title"
    t.text     "message"
    t.boolean  "read",         default: false
    t.datetime "read_at"
    t.boolean  "mobile",       default: false
    t.integer  "target_id"
    t.string   "target_model"
    t.integer  "category_id"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.integer  "entity_id"
  end

  create_table "attendance_report_types", force: :cascade do |t|
    t.string   "name"
    t.boolean  "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "attendance_sei_cadastres", force: :cascade do |t|
    t.string   "cpf"
    t.string   "document_number"
    t.integer  "staff_id"
    t.integer  "procedure_id"
    t.text     "files",                        array: true
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "attendance_service_stations", force: :cascade do |t|
    t.string   "name"
    t.integer  "city_id"
    t.boolean  "status",     default: true
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.index ["city_id"], name: "index_attendance_service_stations_on_city_id", using: :btree
  end

  create_table "attendance_ticket_action_contexts", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "attendance_ticket_action_situations", force: :cascade do |t|
    t.string   "name"
    t.string   "external_name"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "attendance_ticket_actions", force: :cascade do |t|
    t.integer  "ticket_id"
    t.integer  "context_id"
    t.integer  "situation_id"
    t.datetime "started_at"
    t.datetime "ended_at"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "attendance_ticket_comments", force: :cascade do |t|
    t.integer  "ticket_id"
    t.text     "message"
    t.boolean  "read"
    t.datetime "read_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "attendance_ticket_context_notifications", force: :cascade do |t|
    t.integer  "context_id"
    t.integer  "action_context_id"
    t.string   "action"
    t.string   "title"
    t.text     "message"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  create_table "attendance_ticket_contexts", force: :cascade do |t|
    t.string   "name"
    t.text     "confirmation_text"
    t.boolean  "confirmation_required"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  create_table "attendance_ticket_situations", force: :cascade do |t|
    t.string   "name"
    t.string   "external_name"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "attendance_ticket_upload_categories", force: :cascade do |t|
    t.string   "name"
    t.string   "target_method"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "attendance_ticket_uploads", force: :cascade do |t|
    t.integer  "action_id"
    t.integer  "category_id"
    t.string   "document"
    t.integer  "target_id"
    t.string   "target_model"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.boolean  "read"
    t.integer  "reader_id"
  end

  create_table "attendance_tickets", force: :cascade do |t|
    t.integer  "cadastre_id"
    t.integer  "cadastre_mirror_id"
    t.datetime "started_at"
    t.datetime "ended_at"
    t.integer  "attendant_id"
    t.text     "attendant_comment"
    t.boolean  "attendant_status",   default: false
    t.integer  "supervisor_id"
    t.text     "supervisor_comment"
    t.boolean  "supervisor_status",  default: false
    t.integer  "situation_id"
    t.integer  "context_id"
    t.boolean  "active",             default: true
    t.boolean  "mobile",             default: false
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
    t.boolean  "viewr"
    t.integer  "viewr_id"
    t.integer  "give_back_id"
    t.index ["cadastre_id"], name: "index_attendance_tickets_on_cadastre_id", using: :btree
    t.index ["cadastre_mirror_id"], name: "index_attendance_tickets_on_cadastre_mirror_id", using: :btree
  end

