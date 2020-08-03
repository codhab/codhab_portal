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
    t.datetime "created_at",                                 null: false
    t.datetime "updated_at",                                 null: false
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
    t.string   "generic_situation"
    t.float    "sale_value"
    t.float    "evaluation_value"
    t.boolean  "voi",                        default: false
    t.string   "address_old"
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
    t.datetime "term_one_date"
    t.datetime "term_two_date"
    t.datetime "term_three_date"
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

  create_table "attendance_dossiers", force: :cascade do |t|
    t.integer  "cadastre_id"
    t.string   "name"
    t.date     "born"
    t.integer  "gender"
    t.integer  "nationality"
    t.integer  "place_birth_uf_id"
    t.string   "place_birth"
    t.string   "mother_name"
    t.string   "rg"
    t.string   "rg_org"
    t.integer  "rg_uf_id"
    t.date     "rg_emission_date"
    t.string   "pis_nis_pasep"
    t.string   "cpf"
    t.string   "job"
    t.string   "address"
    t.string   "address_number"
    t.string   "address_complement"
    t.integer  "city_id"
    t.integer  "uf_id"
    t.string   "cep"
    t.string   "phone"
    t.string   "cellphone"
    t.string   "phone_secondary"
    t.integer  "civil_state"
    t.integer  "education_level"
    t.string   "cnpj_cpf_paying_source"
    t.string   "admission_date"
    t.float    "income_gross_proven"
    t.float    "income_liquid_proven"
    t.integer  "reference_month_prove"
    t.date     "income_started_at"
    t.float    "income_liquid_declared"
    t.integer  "reference_month_declared"
    t.integer  "under_age_type"
    t.string   "tutor_name"
    t.string   "tutor_cpf"
    t.string   "spouse_name"
    t.string   "spouse_cpf"
    t.date     "spouse_born"
    t.integer  "spouse_gender"
    t.integer  "spouse_nationality"
    t.integer  "spouse_place_birth_uf_id"
    t.integer  "spouse_place_birth"
    t.string   "spouse_mother_name"
    t.string   "spouse_rg"
    t.string   "spouse_rg_org"
    t.integer  "spouse_rg_uf_id"
    t.date     "spouse_rg_emission_date"
    t.string   "spouse_pis_nis_pasep"
    t.string   "spouse_job"
    t.string   "spouse_phone"
    t.string   "spouse_cellphone"
    t.string   "spouse_phone_secondary"
    t.integer  "spouse_education_level"
    t.string   "spouse_cnpj_cpf_paying_source"
    t.string   "spouse_admission_date"
    t.integer  "spouse_income_gross_proven",      default: 0
    t.integer  "spouse_income_liquid_proven",     default: 0
    t.integer  "spouse_reference_month_prove"
    t.date     "spouse_income_started_at"
    t.integer  "spouse_income_liquid_declared",   default: 0
    t.integer  "spouse_reference_month_declared"
    t.integer  "spouse_under_age_type"
    t.string   "spouse_tutor_name"
    t.string   "spouse_tutor_cpf"
    t.boolean  "spouse_absent"
    t.boolean  "adapted_unit",                    default: false
    t.text     "adapted_unit_item",               default: [],                 array: true
    t.string   "first_witnesses_name"
    t.string   "first_witnesses_cpf"
    t.string   "second_witnesses_name"
    t.string   "second_witnesses_cpf"
    t.boolean  "in_attendance",                   default: false
    t.integer  "in_attendance_user_id"
    t.boolean  "caixa_cadunico",                  default: false
    t.integer  "caixa_cadunico_user_id"
    t.text     "caixa_cadunico_observation"
    t.boolean  "caixa_form",                      default: false
    t.integer  "caixa_form_user_id"
    t.text     "caixa_form_observation"
    t.boolean  "cancelled",                       default: false
    t.integer  "cancelled_user_id"
    t.integer  "cancelled_observation"
    t.boolean  "caixa_send",                      default: false
    t.integer  "caixa_send_user_id"
    t.text     "caixa_send_observation"
    t.boolean  "problem",                         default: false
    t.integer  "problem_user_id"
    t.integer  "problem_observation"
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
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

  create_table "attendance_typologies", force: :cascade do |t|
    t.string   "name"
    t.boolean  "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "audits", force: :cascade do |t|
    t.integer  "auditable_id"
    t.string   "auditable_type"
    t.integer  "associated_id"
    t.string   "associated_type"
    t.integer  "user_id"
    t.string   "user_type"
    t.string   "username"
    t.string   "action"
    t.text     "audited_changes"
    t.integer  "version",         default: 0
    t.string   "comment"
    t.string   "remote_address"
    t.string   "request_uuid"
    t.datetime "created_at"
    t.index ["associated_id", "associated_type"], name: "associated_index", using: :btree
    t.index ["associated_type", "associated_id"], name: "associated_index", using: :btree
    t.index ["auditable_id", "auditable_type"], name: "auditable_index", using: :btree
    t.index ["auditable_type", "auditable_id"], name: "auditable_index", using: :btree
    t.index ["created_at"], name: "index_audits_on_created_at", using: :btree
    t.index ["created_at"], name: "index_audits_on_created_at", using: :btree
    t.index ["request_uuid"], name: "index_audits_on_request_uuid", using: :btree
    t.index ["request_uuid"], name: "index_audits_on_request_uuid", using: :btree
    t.index ["user_id", "user_type"], name: "user_index", using: :btree
    t.index ["user_id", "user_type"], name: "user_index", using: :btree
  end

  create_table "audits", force: :cascade do |t|
    t.integer  "auditable_id"
    t.string   "auditable_type"
    t.integer  "associated_id"
    t.string   "associated_type"
    t.integer  "user_id"
    t.string   "user_type"
    t.string   "username"
    t.string   "action"
    t.text     "audited_changes"
    t.integer  "version",         default: 0
    t.string   "comment"
    t.string   "remote_address"
    t.string   "request_uuid"
    t.datetime "created_at"
    t.index ["associated_id", "associated_type"], name: "associated_index", using: :btree
    t.index ["associated_type", "associated_id"], name: "associated_index", using: :btree
    t.index ["auditable_id", "auditable_type"], name: "auditable_index", using: :btree
    t.index ["auditable_type", "auditable_id"], name: "auditable_index", using: :btree
    t.index ["created_at"], name: "index_audits_on_created_at", using: :btree
    t.index ["created_at"], name: "index_audits_on_created_at", using: :btree
    t.index ["request_uuid"], name: "index_audits_on_request_uuid", using: :btree
    t.index ["request_uuid"], name: "index_audits_on_request_uuid", using: :btree
    t.index ["user_id", "user_type"], name: "user_index", using: :btree
    t.index ["user_id", "user_type"], name: "user_index", using: :btree
  end

  create_table "brb_categories", force: :cascade do |t|
    t.string   "name"
    t.boolean  "status"
    t.float    "default_value"
    t.text     "description"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "brb_invoices", force: :cascade do |t|
    t.integer  "category_id"
    t.string   "barcode"
    t.string   "barcode_with_format"
    t.string   "bank_agency"
    t.string   "bank_account"
    t.string   "cpf"
    t.string   "name"
    t.string   "address"
    t.integer  "state_id"
    t.string   "city"
    t.string   "cep"
    t.integer  "type_person",         default: 0
    t.integer  "modality",            default: 0
    t.integer  "type_document",       default: 0
    t.string   "code"
    t.date     "due"
    t.float    "value",               default: 0.0
    t.text     "message"
    t.date     "payment"
    t.integer  "status",              default: 0
    t.boolean  "remittance"
    t.text     "bank_return"
    t.string   "our_number"
    t.string   "document_number"
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.integer  "invoice_type"
    t.date     "credit"
    t.string   "cnpj"
    t.index ["category_id"], name: "index_brb_invoices_on_category_id", using: :btree
    t.index ["code"], name: "index_brb_invoices_on_code", unique: true, using: :btree
    t.index ["state_id"], name: "index_brb_invoices_on_state_id", using: :btree
  end

  create_table "brb_remittances", force: :cascade do |t|
    t.text     "content"
    t.text     "header_content"
    t.integer  "invoices_id",                                 array: true
    t.boolean  "publish",        default: false
    t.date     "date"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
  end

  create_table "candidate_activity_statuses", force: :cascade do |t|
    t.string   "title"
    t.boolean  "status",     default: true
    t.integer  "code"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.index ["code"], name: "index_candidate_activity_statuses_on_code", unique: true, using: :btree
  end

  create_table "candidate_ammvs", force: :cascade do |t|
    t.string   "cpf"
    t.string   "name"
    t.string   "address"
    t.string   "unit"
    t.string   "singnature_date"
    t.string   "register_date"
    t.string   "constructor"
    t.string   "finance_agent"
    t.string   "cdru"
    t.string   "cdru_observation"
    t.integer  "unit_id"
    t.integer  "cadastre_id"
    t.integer  "index_migrate"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.index ["cadastre_id"], name: "index_candidate_ammvs_on_cadastre_id", using: :btree
    t.index ["unit_id"], name: "index_candidate_ammvs_on_unit_id", using: :btree
  end

  create_table "candidate_askings", force: :cascade do |t|
    t.integer  "cadastre_id"
    t.string   "dependent"
    t.string   "income"
    t.string   "special_condition"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.index ["cadastre_id"], name: "index_candidate_askings_on_cadastre_id", using: :btree
  end

  create_table "candidate_attendance_log_statuses", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.boolean  "status",      default: true
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "candidate_attendance_logs", force: :cascade do |t|
    t.integer  "cadastre_mirror_id"
    t.integer  "cadastre_id"
    t.integer  "user_id"
    t.integer  "attendance_status_id"
    t.string   "observation"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.index ["cadastre_id"], name: "index_candidate_attendance_logs_on_cadastre_id", using: :btree
    t.index ["cadastre_mirror_id"], name: "index_candidate_attendance_logs_on_cadastre_mirror_id", using: :btree
    t.index ["user_id"], name: "index_candidate_attendance_logs_on_user_id", using: :btree
  end

  create_table "candidate_attendance_statuses", force: :cascade do |t|
    t.string   "name"
    t.boolean  "status",     default: true
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.integer  "code"
  end

  create_table "candidate_attendances", force: :cascade do |t|
    t.integer  "cadastre_id"
    t.integer  "cadastre_mirror_id"
    t.integer  "convocation_id"
    t.integer  "attendance_status_id"
    t.integer  "staff_id"
    t.text     "observation"
    t.boolean  "status",               default: true
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["attendance_status_id"], name: "index_candidate_attendances_on_attendance_status_id", using: :btree
    t.index ["cadastre_id"], name: "index_candidate_attendances_on_cadastre_id", using: :btree
    t.index ["cadastre_mirror_id"], name: "index_candidate_attendances_on_cadastre_mirror_id", using: :btree
    t.index ["convocation_id"], name: "index_candidate_attendances_on_convocation_id", using: :btree
    t.index ["staff_id"], name: "index_candidate_attendances_on_staff_id", using: :btree
  end

  create_table "candidate_cadastre_activities", force: :cascade do |t|
    t.integer  "cadastre_id"
    t.integer  "cadastre_mirror_id"
    t.integer  "staff_id"
    t.integer  "activity_status_id"
    t.integer  "type_activity",      default: 0
    t.text     "observation"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.boolean  "himself"
    t.index ["activity_status_id"], name: "index_candidate_cadastre_activities_on_activity_status_id", using: :btree
    t.index ["cadastre_id"], name: "index_candidate_cadastre_activities_on_cadastre_id", using: :btree
    t.index ["cadastre_mirror_id"], name: "index_candidate_cadastre_activities_on_cadastre_mirror_id", using: :btree
    t.index ["staff_id"], name: "index_candidate_cadastre_activities_on_staff_id", using: :btree
  end

  create_table "candidate_cadastre_addresses", force: :cascade do |t|
    t.integer  "cadastre_id"
    t.integer  "cadastre_mirror_id"
    t.integer  "unit_id"
    t.string   "dominial_chain"
    t.integer  "type_occurrence"
    t.string   "observation"
    t.integer  "type_receipt"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.integer  "situation_id"
    t.integer  "staff_id"
    t.integer  "user_company_id"
    t.integer  "regularization_type_id"
    t.integer  "second_cadastre_id"
    t.integer  "third_cadastre_id"
    t.integer  "fourth_cadastre_id"
    t.index ["cadastre_id"], name: "index_candidate_cadastre_addresses_on_cadastre_id", using: :btree
    t.index ["cadastre_mirror_id"], name: "index_candidate_cadastre_addresses_on_cadastre_mirror_id", using: :btree
    t.index ["regularization_type_id"], name: "index_candidate_cadastre_addresses_on_regularization_type_id", using: :btree
    t.index ["situation_id"], name: "index_candidate_cadastre_addresses_on_situation_id", using: :btree
    t.index ["staff_id"], name: "index_candidate_cadastre_addresses_on_staff_id", using: :btree
    t.index ["unit_id"], name: "index_candidate_cadastre_addresses_on_unit_id", using: :btree
    t.index ["user_company_id"], name: "index_candidate_cadastre_addresses_on_user_company_id", using: :btree
  end

  create_table "candidate_cadastre_attendance_statuses", force: :cascade do |t|
    t.integer  "cadastre_attendance_id"
    t.integer  "attendance_status_id"
    t.integer  "staff_id"
    t.integer  "mirror_id"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.index ["attendance_status_id"], name: "index_attendace_status_id", using: :btree
    t.index ["cadastre_attendance_id"], name: "index_cadastre_attendance_id", using: :btree
    t.index ["mirror_id"], name: "index_candidate_cadastre_attendance_statuses_on_mirror_id", using: :btree
    t.index ["staff_id"], name: "index_candidate_cadastre_attendance_statuses_on_staff_id", using: :btree
  end

  create_table "candidate_cadastre_attendances", force: :cascade do |t|
    t.integer  "cadastre_id"
    t.integer  "cadastre_mirror_id"
    t.integer  "staff_id"
    t.integer  "situation",          default: 0
    t.integer  "attendance_type",    default: 0
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.index ["cadastre_id"], name: "index_candidate_cadastre_attendances_on_cadastre_id", using: :btree
    t.index ["cadastre_mirror_id"], name: "index_candidate_cadastre_attendances_on_cadastre_mirror_id", using: :btree
    t.index ["staff_id"], name: "index_candidate_cadastre_attendances_on_staff_id", using: :btree
  end

  create_table "candidate_cadastre_convocations", force: :cascade do |t|
    t.integer  "cadastre_id"
    t.integer  "convocation_id"
    t.boolean  "status",         default: true
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.integer  "staff_id"
    t.index ["cadastre_id"], name: "index_candidate_cadastre_convocations_on_cadastre_id", using: :btree
    t.index ["convocation_id"], name: "index_candidate_cadastre_convocations_on_convocation_id", using: :btree
  end

  create_table "candidate_cadastre_events", force: :cascade do |t|
    t.integer  "staff_id"
    t.integer  "cadastre_id"
    t.text     "cadastre_old"
    t.text     "cadastre_new"
    t.text     "observation_staff"
    t.text     "observation_system"
    t.integer  "situation",          default: 0
    t.boolean  "status",             default: true
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.index ["cadastre_id"], name: "index_candidate_cadastre_events_on_cadastre_id", using: :btree
    t.index ["staff_id"], name: "index_candidate_cadastre_events_on_staff_id", using: :btree
  end

  create_table "candidate_cadastre_geolocations", force: :cascade do |t|
    t.integer  "cadastre_id"
    t.string   "lat"
    t.string   "lng"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.string   "geolocation_type"
    t.string   "geolocation_level"
    t.index ["cadastre_id"], name: "index_candidate_cadastre_geolocations_on_cadastre_id", using: :btree
  end

  create_table "candidate_cadastre_mirrors", force: :cascade do |t|
    t.string   "name"
    t.string   "cpf",                       default: "", null: false
    t.integer  "gender"
    t.date     "born"
    t.string   "born_uf"
    t.string   "rg"
    t.string   "rg_org"
    t.string   "rg_uf"
    t.string   "place_birth"
    t.date     "arrival_df"
    t.string   "telephone"
    t.string   "telephone_optional"
    t.string   "celphone"
    t.string   "email"
    t.integer  "special_condition_id"
    t.string   "cep"
    t.string   "mother_name"
    t.float    "main_income"
    t.integer  "city_id"
    t.integer  "state_id"
    t.string   "address"
    t.string   "address_complement"
    t.float    "income"
    t.string   "work_cep"
    t.integer  "work_city_id"
    t.string   "work_address"
    t.integer  "work_state_id"
    t.string   "nis"
    t.string   "cid"
    t.integer  "civil_state_id"
    t.integer  "program_id"
    t.boolean  "adapted_property"
    t.integer  "cadastre_id"
    t.integer  "cadastre_type",             default: 0
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.integer  "situation",                 default: 0
    t.string   "employment"
    t.date     "admission_date"
    t.integer  "special_condition_type_id"
    t.integer  "situation_id"
    t.integer  "procedural_id"
    t.string   "action"
    t.index ["cadastre_id"], name: "index_candidate_cadastre_mirrors_on_cadastre_id", using: :btree
    t.index ["city_id"], name: "index_candidate_cadastre_mirrors_on_city_id", using: :btree
    t.index ["civil_state_id"], name: "index_candidate_cadastre_mirrors_on_civil_state_id", using: :btree
    t.index ["program_id"], name: "index_candidate_cadastre_mirrors_on_program_id", using: :btree
    t.index ["special_condition_id"], name: "index_candidate_cadastre_mirrors_on_special_condition_id", using: :btree
    t.index ["state_id"], name: "index_candidate_cadastre_mirrors_on_state_id", using: :btree
    t.index ["work_city_id"], name: "index_candidate_cadastre_mirrors_on_work_city_id", using: :btree
  end

  create_table "candidate_cadastre_observations", force: :cascade do |t|
    t.integer  "cadastre_id"
    t.text     "observation"
    t.integer  "staff_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["cadastre_id"], name: "index_candidate_cadastre_observations_on_cadastre_id", using: :btree
    t.index ["staff_id"], name: "index_candidate_cadastre_observations_on_staff_id", using: :btree
  end

  create_table "candidate_cadastre_occurrences", force: :cascade do |t|
    t.integer  "cadastre_id"
    t.integer  "attendance_id"
    t.integer  "program_id"
    t.integer  "creator_id"
    t.string   "description"
    t.string   "label_portal"
    t.string   "description_portal"
    t.boolean  "portal",               default: false
    t.integer  "validation_id"
    t.integer  "target_model_id"
    t.text     "object_return"
    t.boolean  "solved",               default: false
    t.integer  "feedback_staff_id"
    t.text     "feedback_observation"
    t.string   "feedback_archive"
    t.datetime "feedback_datetime"
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
    t.index ["attendance_id"], name: "index_candidate_cadastre_occurrences_on_attendance_id", using: :btree
    t.index ["cadastre_id"], name: "index_candidate_cadastre_occurrences_on_cadastre_id", using: :btree
    t.index ["creator_id"], name: "index_candidate_cadastre_occurrences_on_creator_id", using: :btree
    t.index ["feedback_staff_id"], name: "index_candidate_cadastre_occurrences_on_feedback_staff_id", using: :btree
    t.index ["program_id"], name: "index_candidate_cadastre_occurrences_on_program_id", using: :btree
    t.index ["target_model_id"], name: "index_candidate_cadastre_occurrences_on_target_model_id", using: :btree
    t.index ["validation_id"], name: "index_candidate_cadastre_occurrences_on_validation_id", using: :btree
  end

  create_table "candidate_cadastre_procedurals", force: :cascade do |t|
    t.integer  "cadastre_mirror_id"
    t.integer  "cadastre_id"
    t.integer  "procedural_status_id"
    t.integer  "convocation_id"
    t.integer  "assessment_id"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.string   "old_process"
    t.integer  "staff_id"
    t.text     "observation"
    t.string   "transfer_process"
    t.integer  "transfer_assessment_id"
    t.integer  "cadastre_convocation_id"
    t.string   "sei_assessment"
    t.index ["assessment_id"], name: "index_candidate_cadastre_procedurals_on_assessment_id", using: :btree
    t.index ["cadastre_mirror_id"], name: "index_candidate_cadastre_procedurals_on_cadastre_mirror_id", using: :btree
    t.index ["convocation_id"], name: "index_candidate_cadastre_procedurals_on_convocation_id", using: :btree
    t.index ["procedural_status_id"], name: "index_candidate_cadastre_procedurals_on_procedural_status_id", using: :btree
    t.index ["staff_id"], name: "index_candidate_cadastre_procedurals_on_staff_id", using: :btree
    t.index ["transfer_assessment_id"], name: "index_candidate_cadastre_procedurals_on_transfer_assessment_id", using: :btree
  end

  create_table "candidate_cadastre_programs", force: :cascade do |t|
    t.integer  "program_id"
    t.integer  "sub_program_id"
    t.integer  "cadastre_id"
    t.text     "observation"
    t.integer  "staff_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "candidate_cadastre_references", force: :cascade do |t|
    t.string   "cpf"
    t.integer  "data_id"
    t.string   "code"
    t.boolean  "status",     default: true
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "candidate_cadastre_situations", force: :cascade do |t|
    t.integer  "cadastre_mirror_id"
    t.integer  "cadastre_id"
    t.integer  "situation_status_id"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.text     "observation"
    t.integer  "staff_id"
    t.integer  "cadastre_convocation_id"
    t.index ["cadastre_id"], name: "index_candidate_cadastre_situations_on_cadastre_id", using: :btree
    t.index ["cadastre_mirror_id"], name: "index_candidate_cadastre_situations_on_cadastre_mirror_id", using: :btree
    t.index ["situation_status_id"], name: "index_candidate_cadastre_situations_on_situation_status_id", using: :btree
  end

  create_table "candidate_cadastres", force: :cascade do |t|
    t.string   "name"
    t.string   "cpf",                       default: "",    null: false
    t.integer  "gender"
    t.date     "born"
    t.string   "born_uf"
    t.string   "rg"
    t.string   "rg_org"
    t.string   "rg_uf"
    t.string   "place_birth"
    t.date     "arrival_df"
    t.string   "telephone"
    t.string   "telephone_optional"
    t.string   "celphone"
    t.string   "email"
    t.integer  "special_condition_id"
    t.string   "cep"
    t.integer  "city_id"
    t.integer  "state_id"
    t.string   "address"
    t.string   "address_complement"
    t.float    "income"
    t.float    "main_income"
    t.string   "work_cep"
    t.integer  "work_city_id"
    t.string   "work_address"
    t.string   "nis"
    t.string   "cid"
    t.string   "mother_name"
    t.integer  "civil_state_id"
    t.boolean  "special_condition_flag"
    t.integer  "program_id"
    t.boolean  "adapted_property"
    t.integer  "old_cadastre_id"
    t.date     "date_old_cadastre"
    t.integer  "seqcad_id"
    t.integer  "special_dependent_count"
    t.datetime "last_signed_in"
    t.string   "password"
    t.string   "secret_ask"
    t.string   "secret_answer"
    t.string   "remember_token"
    t.string   "session_token"
    t.datetime "created_at",                                null: false
    t.datetime "updated_at",                                null: false
    t.string   "introduce"
    t.string   "employment"
    t.date     "admission_date"
    t.integer  "created_by"
    t.integer  "creator_id"
    t.string   "lat"
    t.string   "lng"
    t.integer  "special_condition_type_id"
    t.string   "nationality"
    t.string   "access_token"
    t.text     "mobile_user_token"
    t.text     "mobile_push_token"
    t.string   "avatar"
    t.string   "wedding_regime"
    t.date     "wedding_date"
    t.string   "father_name"
    t.boolean  "scoring",                   default: false
    t.integer  "sub_program_id"
    t.boolean  "defunct",                   default: false
    t.index ["city_id"], name: "index_candidate_cadastres_on_city_id", using: :btree
    t.index ["civil_state_id"], name: "index_candidate_cadastres_on_civil_state_id", using: :btree
    t.index ["cpf"], name: "index_candidate_cadastres_on_cpf", unique: true, using: :btree
    t.index ["id"], name: "cadastre_idx", unique: true, using: :btree
    t.index ["program_id"], name: "index_candidate_cadastres_on_program_id", using: :btree
    t.index ["remember_token"], name: "index_candidate_cadastres_on_remember_token", unique: true, using: :btree
    t.index ["special_condition_id"], name: "index_candidate_cadastres_on_special_condition_id", using: :btree
    t.index ["state_id"], name: "index_candidate_cadastres_on_state_id", using: :btree
    t.index ["work_city_id"], name: "index_candidate_cadastres_on_work_city_id", using: :btree
  end

  create_table "candidate_cadins", force: :cascade do |t|
    t.string   "number_control"
    t.string   "name"
    t.date     "born"
    t.string   "process"
    t.integer  "occurrence_cadin_id"
    t.integer  "signed_instrument_id"
    t.string   "place_birth"
    t.string   "uf_born"
    t.string   "address"
    t.string   "cep"
    t.integer  "city_id"
    t.string   "cpf"
    t.string   "rg"
    t.date     "distribution_date"
    t.string   "percentage"
    t.text     "observation"
    t.boolean  "espolio"
    t.boolean  "freedup"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.index ["city_id"], name: "index_candidate_cadins_on_city_id", using: :btree
    t.index ["occurrence_cadin_id"], name: "index_candidate_cadins_on_occurrence_cadin_id", using: :btree
    t.index ["signed_instrument_id"], name: "index_candidate_cadins_on_signed_instrument_id", using: :btree
  end

  create_table "candidate_candidate_cadastre_removeds", force: :cascade do |t|
    t.integer  "cadastre_id"
    t.string   "name"
    t.string   "cpf",                     default: "", null: false
    t.integer  "gender"
    t.date     "born"
    t.string   "born_uf"
    t.string   "rg"
    t.string   "rg_org"
    t.string   "rg_uf"
    t.string   "place_birth"
    t.date     "arrival_df"
    t.string   "telephone"
    t.string   "telephone_optional"
    t.string   "celphone"
    t.string   "email"
    t.integer  "special_condition"
    t.string   "cep"
    t.integer  "city"
    t.integer  "state"
    t.string   "address"
    t.string   "address_complement"
    t.float    "income"
    t.float    "main_income"
    t.string   "work_cep"
    t.integer  "work_city"
    t.string   "work_address"
    t.string   "nis"
    t.string   "cid"
    t.string   "mother_name"
    t.integer  "civil_state"
    t.boolean  "special_condition_flag"
    t.integer  "program"
    t.boolean  "adapted_property"
    t.integer  "old_cadastre_id"
    t.date     "date_old_cadastre"
    t.integer  "seqcad_id"
    t.integer  "special_dependent_count"
    t.datetime "last_signed_in"
    t.string   "password"
    t.string   "secret_ask"
    t.string   "secret_answer"
    t.string   "remember_token"
    t.string   "session_token"
    t.text     "motive"
    t.integer  "old_id"
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
  end

  create_table "candidate_civil_states", force: :cascade do |t|
    t.string   "name"
    t.boolean  "status",     default: true
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "candidate_comunids", force: :cascade do |t|
    t.string   "code"
    t.string   "block"
    t.string   "group"
    t.string   "unit"
    t.string   "condominium"
    t.string   "sector"
    t.integer  "seal"
    t.string   "code_letter"
    t.string   "condition_interview"
    t.string   "outher_condition"
    t.string   "main_name"
    t.string   "main_rg"
    t.string   "main_cpf"
    t.string   "main_born"
    t.string   "main_uf_born"
    t.string   "main_telephone"
    t.string   "telephone_type"
    t.string   "main_nationality"
    t.integer  "total_family"
    t.string   "interviewed"
    t.string   "interviewed_rg"
    t.string   "interviewed_position"
    t.string   "residence_time"
    t.string   "residence_time_cond"
    t.string   "special_needs"
    t.string   "name_single_spouse"
    t.string   "residence_use"
    t.string   "construction_type"
    t.string   "number_floor"
    t.string   "rent_value"
    t.string   "water_supply"
    t.string   "water_box"
    t.string   "sewer"
    t.string   "bath_condition"
    t.string   "celeta_garbage"
    t.string   "eletrical_energy"
    t.string   "energy_standart"
    t.string   "energy_standart_situation"
    t.string   "flood"
    t.string   "mail_receive"
    t.string   "mail_box"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "candidate_convocations", force: :cascade do |t|
    t.string   "description"
    t.date     "date_start"
    t.date     "date_end"
    t.integer  "quantity",           default: 0
    t.text     "criteria"
    t.boolean  "status"
    t.string   "year_month"
    t.integer  "pontuation_code_id"
    t.integer  "pontuation_start",   default: 0
    t.integer  "pontuation_end",     default: 0
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.integer  "program_id"
    t.integer  "convocation_type"
    t.index ["pontuation_code_id"], name: "index_candidate_convocations_on_pontuation_code_id", using: :btree
  end

  create_table "candidate_day_ocurrencies", force: :cascade do |t|
    t.integer  "update_income",            default: 0
    t.integer  "update_dependent",         default: 0
    t.integer  "update_special_condition", default: 0
    t.integer  "update_old",               default: 0
    t.integer  "halted",                   default: 0
    t.integer  "update_arrival_df",        default: 0
    t.integer  "enables_day",              default: 0
    t.integer  "change_zone",              default: 0
    t.integer  "update_data",              default: 0
    t.integer  "contemplated_day",         default: 0
    t.date     "date_ocurrency"
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
  end

  create_table "candidate_dependent_mirrors", force: :cascade do |t|
    t.integer  "cadastre_id"
    t.integer  "cadastre_mirror_id"
    t.integer  "dependent_id"
    t.string   "name"
    t.string   "cpf"
    t.string   "rg"
    t.string   "rg_org"
    t.string   "rg_uf_id"
    t.date     "born"
    t.integer  "gender"
    t.string   "place_birth"
    t.integer  "civil_state_id"
    t.float    "income"
    t.integer  "kinship_id"
    t.boolean  "co_acquirer",               default: false
    t.float    "percentage"
    t.integer  "special_condition_id"
    t.boolean  "special_condition_flag",    default: false
    t.string   "cid"
    t.string   "nis"
    t.datetime "created_at",                                null: false
    t.datetime "updated_at",                                null: false
    t.string   "employment"
    t.date     "admission_date"
    t.integer  "special_condition_type_id"
    t.string   "action"
    t.index ["cadastre_id"], name: "index_candidate_dependent_mirrors_on_cadastre_id", using: :btree
    t.index ["cadastre_mirror_id"], name: "index_candidate_dependent_mirrors_on_cadastre_mirror_id", using: :btree
    t.index ["civil_state_id"], name: "index_candidate_dependent_mirrors_on_civil_state_id", using: :btree
    t.index ["dependent_id"], name: "index_candidate_dependent_mirrors_on_dependent_id", using: :btree
    t.index ["kinship_id"], name: "index_candidate_dependent_mirrors_on_kinship_id", using: :btree
    t.index ["special_condition_id"], name: "index_candidate_dependent_mirrors_on_special_condition_id", using: :btree
  end

  create_table "candidate_dependent_removeds", force: :cascade do |t|
    t.integer  "cadastre_id"
    t.string   "cadastre_cpf"
    t.string   "name"
    t.string   "cpf"
    t.string   "rg"
    t.string   "rg_org"
    t.string   "rg_uf_id"
    t.date     "born"
    t.integer  "gender"
    t.string   "place_birth"
    t.integer  "civil_state_id"
    t.float    "income"
    t.integer  "kinship_id"
    t.boolean  "co_acquirer",            default: false
    t.float    "percentage"
    t.integer  "special_condition_id"
    t.boolean  "special_condition_flag", default: false
    t.string   "cid"
    t.string   "nis"
    t.text     "observation"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
  end

  create_table "candidate_dependents", force: :cascade do |t|
    t.integer  "cadastre_id"
    t.string   "name"
    t.string   "cpf"
    t.string   "rg"
    t.string   "rg_org"
    t.string   "rg_uf_id"
    t.date     "born"
    t.integer  "gender"
    t.string   "place_birth"
    t.integer  "civil_state_id"
    t.float    "income"
    t.integer  "kinship_id"
    t.boolean  "co_acquirer",               default: false
    t.float    "percentage"
    t.integer  "special_condition_id"
    t.boolean  "special_condition_flag",    default: false
    t.string   "cid"
    t.string   "nis"
    t.datetime "created_at",                                null: false
    t.datetime "updated_at",                                null: false
    t.string   "employment"
    t.date     "admission_date"
    t.integer  "special_condition_type_id"
    t.string   "nationality"
    t.string   "mother_name"
    t.string   "father_name"
    t.integer  "right_of_use_type"
    t.string   "right_of_use_process"
    t.boolean  "defunct",                   default: false
    t.index ["cadastre_id"], name: "index_candidate_dependents_on_cadastre_id", using: :btree
    t.index ["civil_state_id"], name: "index_candidate_dependents_on_civil_state_id", using: :btree
    t.index ["kinship_id"], name: "index_candidate_dependents_on_kinship_id", using: :btree
    t.index ["special_condition_id"], name: "index_candidate_dependents_on_special_condition_id", using: :btree
  end

  create_table "candidate_documents", force: :cascade do |t|
    t.string  "checker"
    t.integer "entity_id"
  end

  create_table "candidate_enterprise_cadastre_situations", force: :cascade do |t|
    t.integer  "enterprise_cadastre_id"
    t.integer  "enterprise_cadastre_status_id"
    t.text     "observation"
    t.string   "file_path"
    t.integer  "firm_user_id"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.integer  "type_action"
    t.boolean  "success"
    t.integer  "enterprise_situation_action_id"
    t.integer  "staff_id"
    t.index ["enterprise_cadastre_id"], name: "index_enterprise_cadastre_on_enterprise_cadastre_id", using: :btree
    t.index ["enterprise_cadastre_status_id"], name: "index_ent_cad_on_enterprise_cad_status_id", using: :btree
    t.index ["firm_user_id"], name: "index_candidate_enterprise_cadastre_situations_on_firm_user_id", using: :btree
  end

  create_table "candidate_enterprise_cadastres", force: :cascade do |t|
    t.integer  "enterprise_id"
    t.integer  "cadastre_id"
    t.integer  "indication_cadastre_id"
    t.date     "inactive_date"
    t.boolean  "inactive"
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
    t.string   "source_list"
    t.integer  "zone"
    t.boolean  "inactive_unmeat",         default: false
    t.integer  "indication_type_id"
    t.integer  "indication_situation_id"
    t.date     "manifestation_date"
    t.boolean  "accepted",                default: false
    t.text     "accepted_observation"
    t.text     "observation"
    t.integer  "staff_id"
    t.datetime "accepted_date"
    t.date     "inactive_at"
    t.integer  "father_id"
    t.index ["cadastre_id"], name: "index_candidate_enterprise_cadastres_on_cadastre_id", using: :btree
    t.index ["enterprise_id"], name: "index_candidate_enterprise_cadastres_on_enterprise_id", using: :btree
    t.index ["indication_cadastre_id"], name: "index_candidate_enterprise_cadastres_on_indication_cadastre_id", using: :btree
  end

  create_table "candidate_enterprise_situation_actions", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.boolean  "status"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "candidate_enterprise_situation_statuses", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.boolean  "status",              default: true
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
    t.boolean  "waiver"
    t.integer  "situation_action_id"
  end

  create_table "candidate_entity_cadastre_evaluations", force: :cascade do |t|
    t.integer  "cadastre_id"
    t.integer  "entity_id"
    t.string   "ticket"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.boolean  "old",         default: false
    t.boolean  "status",      default: true
  end

  create_table "candidate_inheritor_removeds", force: :cascade do |t|
    t.integer  "cadastre_id"
    t.string   "cadastre_cpf"
    t.string   "name"
    t.integer  "inheritor_type_id"
    t.string   "cpf"
    t.string   "rg"
    t.date     "born"
    t.integer  "civil_state_id"
    t.string   "gender"
    t.string   "single_name"
    t.decimal  "percentage"
    t.text     "observation"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  create_table "candidate_inheritor_types", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "candidate_inheritors", force: :cascade do |t|
    t.integer  "cadastre_id"
    t.string   "name"
    t.integer  "inheritor_type_id"
    t.string   "cpf"
    t.string   "rg"
    t.date     "born"
    t.integer  "civil_state_id"
    t.string   "gender"
    t.string   "single_name"
    t.decimal  "percentage"
    t.text     "observation"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.boolean  "spoil"
    t.string   "place_birth"
    t.index ["cadastre_id"], name: "index_candidate_inheritors_on_cadastre_id", using: :btree
    t.index ["civil_state_id"], name: "index_candidate_inheritors_on_civil_state_id", using: :btree
    t.index ["inheritor_type_id"], name: "index_candidate_inheritors_on_inheritor_type_id", using: :btree
  end

  create_table "candidate_iptus", force: :cascade do |t|
    t.string   "cpf"
    t.string   "name"
    t.string   "registration"
    t.string   "address"
    t.string   "city"
    t.string   "kind_realty"
    t.string   "kind_search"
    t.string   "year"
    t.boolean  "realty_codhab"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "candidate_kinships", force: :cascade do |t|
    t.string   "name"
    t.boolean  "status",     default: true
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "candidate_legal_rents", force: :cascade do |t|
    t.integer  "cadastre_id"
    t.boolean  "status",      default: false
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  create_table "candidate_lists", force: :cascade do |t|
    t.string   "title"
    t.string   "condition_sql"
    t.integer  "list_type",     default: 0
    t.string   "view_target"
    t.boolean  "publish"
    t.boolean  "cpf_filter",    default: false
    t.boolean  "name_filter",   default: false
    t.boolean  "income_filter", default: false
    t.string   "slug"
    t.text     "description"
    t.text     "program_id",    default: [],                 array: true
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.index ["slug"], name: "index_candidate_lists_on_slug", unique: true, using: :btree
  end

  create_table "candidate_log_sihabs", force: :cascade do |t|
    t.integer  "cadastre_id"
    t.string   "observation"
    t.string   "type_information"
    t.string   "user"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.index ["cadastre_id"], name: "index_candidate_log_sihabs_on_cadastre_id", using: :btree
  end

  create_table "candidate_occurrence_cadins", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "candidate_ownership_activities", force: :cascade do |t|
    t.integer  "original_cadastre_id"
    t.integer  "target_cadastre_id"
    t.integer  "staff_id"
    t.text     "observation"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  create_table "candidate_pontuations", force: :cascade do |t|
    t.integer  "cadastre_id"
    t.integer  "cadastre_mirror_id"
    t.integer  "code"
    t.float    "bsb"
    t.float    "dependent"
    t.float    "timelist"
    t.float    "special_condition"
    t.float    "income"
    t.float    "total"
    t.integer  "program_id"
    t.integer  "situation_status_id"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.integer  "position"
    t.index ["cadastre_id"], name: "index_candidate_pontuations_on_cadastre_id", using: :btree
    t.index ["cadastre_mirror_id"], name: "index_candidate_pontuations_on_cadastre_mirror_id", using: :btree
    t.index ["program_id"], name: "index_candidate_pontuations_on_program_id", using: :btree
    t.index ["situation_status_id"], name: "index_candidate_pontuations_on_situation_status_id", using: :btree
  end

  create_table "candidate_positions", force: :cascade do |t|
    t.integer  "cadastre_id"
    t.integer  "pontuation_id"
    t.integer  "position"
    t.integer  "program_id"
    t.integer  "zone"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["cadastre_id"], name: "index_candidate_positions_on_cadastre_id", using: :btree
    t.index ["pontuation_id"], name: "index_candidate_positions_on_pontuation_id", using: :btree
    t.index ["program_id"], name: "index_candidate_positions_on_program_id", using: :btree
  end

  create_table "candidate_procedural_statuses", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.string   "code"
    t.boolean  "status",      default: true
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.index ["code"], name: "index_candidate_procedural_statuses_on_code", unique: true, using: :btree
  end

  create_table "candidate_programs", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.boolean  "status",      default: true
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "candidate_questions", force: :cascade do |t|
    t.integer  "ticket_id"
    t.integer  "subject_id"
    t.integer  "staff_id"
    t.integer  "cadastre_id"
    t.text     "message"
    t.integer  "status"
    t.string   "attachment"
    t.boolean  "been_read"
    t.integer  "question_type"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["cadastre_id"], name: "index_candidate_questions_on_cadastre_id", using: :btree
    t.index ["staff_id"], name: "index_candidate_questions_on_staff_id", using: :btree
    t.index ["subject_id"], name: "index_candidate_questions_on_subject_id", using: :btree
    t.index ["ticket_id"], name: "index_candidate_questions_on_ticket_id", using: :btree
  end

  create_table "candidate_regularization_types", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "candidate_sefaz_iptus", force: :cascade do |t|
    t.string   "cpf"
    t.json     "json_return"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "iptu_type"
  end

  create_table "candidate_signed_instruments", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "candidate_situation_cadastre_addresses", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.boolean  "status",      default: false
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  create_table "candidate_situation_statuses", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "code"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "status"
    t.index ["code"], name: "index_candidate_situation_statuses_on_code", unique: true, using: :btree
  end

  create_table "candidate_sms_notifications", force: :cascade do |t|
    t.integer  "cadastre_id"
    t.text     "message"
    t.string   "telephone"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "candidate_special_condition_types", force: :cascade do |t|
    t.string   "name"
    t.boolean  "status",     default: true
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "candidate_special_conditions", force: :cascade do |t|
    t.string   "name"
    t.boolean  "status",     default: true
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "candidate_subjects", force: :cascade do |t|
    t.string   "name"
    t.boolean  "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "candidate_tickets", force: :cascade do |t|
    t.integer  "status"
    t.integer  "cadastre_id"
    t.integer  "staff_id"
    t.integer  "subject_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["cadastre_id"], name: "index_candidate_tickets_on_cadastre_id", using: :btree
    t.index ["staff_id"], name: "index_candidate_tickets_on_staff_id", using: :btree
    t.index ["subject_id"], name: "index_candidate_tickets_on_subject_id", using: :btree
  end

  create_table "candidate_validations", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.string   "portal_label"
    t.boolean  "allow_portal",           default: true
    t.text     "target_model_query"
    t.string   "target_model_function"
    t.integer  "target_return_type",     default: 0
    t.text     "target_return_query"
    t.string   "target_return_function"
    t.string   "target_return_field"
    t.integer  "validation_type",        default: 0
    t.boolean  "contain",                default: true
    t.text     "program_id",                                         array: true
    t.boolean  "publish",                default: true
    t.integer  "occurrence_type",        default: 0
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
  end

  create_table "candidate_vois", force: :cascade do |t|
    t.string   "name"
    t.string   "address"
    t.string   "cpf"
    t.string   "rg"
    t.integer  "situation",  default: 0
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "candidate_zones", force: :cascade do |t|
    t.string   "name"
    t.float    "start_value", default: 0.0
    t.float    "end_value",   default: 0.0
    t.string   "code"
    t.boolean  "status"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.index ["code"], name: "index_candidate_zones_on_code", unique: true, using: :btree
  end

  create_table "certificate_allotments", force: :cascade do |t|
    t.integer  "template_id"
    t.integer  "staff_id"
    t.date     "date"
    t.date     "first_authenticate_date"
    t.date     "second_authenticate_date"
    t.date     "main_authenticate_date"
    t.boolean  "first_authenticate",       default: false
    t.boolean  "second_authenticate",      default: false
    t.boolean  "main_authenticate",        default: false
    t.integer  "main_authenticate_id"
    t.integer  "first_authenticate_id"
    t.integer  "second_authenticate_id"
    t.boolean  "print",                    default: false
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
    t.string   "title"
  end

  create_table "certificate_cadastres", force: :cascade do |t|
    t.integer  "allotment_id"
    t.text     "template_ids",          default: [],              array: true
    t.string   "name"
    t.integer  "civil_code_id"
    t.string   "profile"
    t.date     "date"
    t.date     "date_two"
    t.date     "date_three"
    t.string   "second_name"
    t.string   "address"
    t.integer  "profession"
    t.string   "identification"
    t.string   "enrolment"
    t.string   "enrolment_two"
    t.string   "office"
    t.string   "office_two"
    t.string   "office_three"
    t.string   "registry"
    t.string   "registry_two"
    t.string   "value"
    t.string   "book"
    t.string   "sheet"
    t.string   "add"
    t.string   "complement"
    t.integer  "code_id"
    t.string   "sharing"
    t.string   "forms"
    t.integer  "staff_id"
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
    t.string   "city"
    t.string   "endorsement"
    t.string   "registry_three"
    t.string   "cpf"
    t.string   "organ"
    t.string   "second_signature"
    t.string   "mortgage_registration"
    t.string   "mortgage_book"
    t.string   "mortgage_sheet"
  end

  create_table "certificate_civil_codes", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.string   "complement"
    t.boolean  "status"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "prefex"
  end

  create_table "certificate_codes", force: :cascade do |t|
    t.string   "name"
    t.boolean  "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "certificate_inheritors", force: :cascade do |t|
    t.string   "name"
    t.string   "cpf"
    t.string   "description"
    t.boolean  "status"
    t.integer  "cadastre_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "order"
  end

  create_table "certificate_pages", force: :cascade do |t|
    t.integer  "template_id"
    t.text     "content"
    t.integer  "order"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "certificate_professions", force: :cascade do |t|
    t.string   "name"
    t.boolean  "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "certificate_templates", force: :cascade do |t|
    t.string   "title"
    t.text     "page_one"
    t.text     "page_two"
    t.text     "page_three"
    t.text     "page_four"
    t.boolean  "status",     default: true
    t.string   "link"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "cms_action_sliders", force: :cascade do |t|
    t.string   "thumbnail"
    t.string   "title"
    t.boolean  "status"
    t.integer  "order"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "concourse_candidate_messages", force: :cascade do |t|
    t.integer  "candidate_id"
    t.text     "message"
    t.integer  "message_type"
    t.boolean  "status"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["candidate_id"], name: "index_concourse_candidate_messages_on_candidate_id", using: :btree
  end

  create_table "concourse_candidate_participations", force: :cascade do |t|
    t.integer  "candidate_id"
    t.text     "team_description"
    t.string   "archive_one"
    t.string   "archive_two"
    t.string   "archive_three"
    t.string   "archive_four"
    t.string   "archive_five"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.string   "group_participation"
    t.index ["candidate_id"], name: "index_concourse_candidate_participations_on_candidate_id", using: :btree
  end

  create_table "concourse_candidate_refunds", force: :cascade do |t|
    t.integer  "candidate_id"
    t.string   "account"
    t.string   "operation"
    t.string   "agency"
    t.string   "second_name"
    t.string   "second_cpf"
    t.boolean  "status",          default: false
    t.date     "refund_date"
    t.integer  "project_id"
    t.integer  "state_id"
    t.integer  "city_id"
    t.string   "address"
    t.integer  "account_type_id"
    t.integer  "bank_number"
    t.string   "bank_name"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.string   "attachment"
    t.integer  "staff_id"
    t.string   "agency_name"
  end

  create_table "concourse_candidate_tokens", force: :cascade do |t|
    t.integer  "candidate_id"
    t.string   "secret_key"
    t.boolean  "status",       default: false
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.index ["candidate_id"], name: "index_concourse_candidate_tokens_on_candidate_id", using: :btree
    t.index ["secret_key"], name: "index_concourse_candidate_tokens_on_secret_key", unique: true, using: :btree
  end

