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

ActiveRecord::Schema.define(version: 20181106185808) do

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
    t.index ["auditable_id", "auditable_type"], name: "auditable_index", using: :btree
    t.index ["created_at"], name: "index_audits_on_created_at", using: :btree
    t.index ["request_uuid"], name: "index_audits_on_request_uuid", using: :btree
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
    t.index ["assessment_id"], name: "index_candidate_cadastre_procedurals_on_assessment_id", using: :btree
    t.index ["cadastre_mirror_id"], name: "index_candidate_cadastre_procedurals_on_cadastre_mirror_id", using: :btree
    t.index ["convocation_id"], name: "index_candidate_cadastre_procedurals_on_convocation_id", using: :btree
    t.index ["procedural_status_id"], name: "index_candidate_cadastre_procedurals_on_procedural_status_id", using: :btree
    t.index ["staff_id"], name: "index_candidate_cadastre_procedurals_on_staff_id", using: :btree
    t.index ["transfer_assessment_id"], name: "index_candidate_cadastre_procedurals_on_transfer_assessment_id", using: :btree
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
    t.index ["city_id"], name: "index_candidate_cadastres_on_city_id", using: :btree
    t.index ["civil_state_id"], name: "index_candidate_cadastres_on_civil_state_id", using: :btree
    t.index ["cpf"], name: "index_candidate_cadastres_on_cpf", unique: true, using: :btree
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
    t.index ["cadastre_id"], name: "index_candidate_dependents_on_cadastre_id", using: :btree
    t.index ["civil_state_id"], name: "index_candidate_dependents_on_civil_state_id", using: :btree
    t.index ["kinship_id"], name: "index_candidate_dependents_on_kinship_id", using: :btree
    t.index ["special_condition_id"], name: "index_candidate_dependents_on_special_condition_id", using: :btree
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

  create_table "concourse_candidates", force: :cascade do |t|
    t.string   "name"
    t.string   "rg"
    t.integer  "gender"
    t.date     "born"
    t.string   "cpf"
    t.string   "address"
    t.string   "burgh"
    t.string   "city"
    t.string   "cep"
    t.string   "telephone"
    t.string   "celphone"
    t.string   "email"
    t.string   "fantasy_name"
    t.string   "social_reason"
    t.string   "cnpj"
    t.string   "password"
    t.boolean  "terms_use"
    t.integer  "state_id"
    t.integer  "subscribe_id"
    t.text     "properties"
    t.string   "protocol"
    t.text     "observation"
    t.integer  "status",            default: 0
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.integer  "professional_type"
    t.text     "group",             default: [],              array: true
    t.index ["state_id"], name: "index_concourse_candidates_on_state_id", using: :btree
    t.index ["subscribe_id"], name: "index_concourse_candidates_on_subscribe_id", using: :btree
  end

  create_table "concourse_consults", force: :cascade do |t|
    t.text     "content"
    t.boolean  "status",     default: false
    t.boolean  "terms_use",  default: false
    t.integer  "project_id"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.boolean  "responded"
    t.index ["project_id"], name: "index_concourse_consults_on_project_id", using: :btree
  end

  create_table "concourse_fields", force: :cascade do |t|
    t.integer  "subscribe_id"
    t.integer  "participation_id"
    t.string   "label"
    t.integer  "field_type"
    t.boolean  "required"
    t.boolean  "unique"
    t.integer  "max_size"
    t.string   "file_white_list"
    t.boolean  "only_number"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.index ["participation_id"], name: "index_concourse_fields_on_participation_id", using: :btree
    t.index ["subscribe_id"], name: "index_concourse_fields_on_subscribe_id", using: :btree
  end

  create_table "concourse_navs", force: :cascade do |t|
    t.integer  "project_id"
    t.integer  "page_id"
    t.string   "label"
    t.string   "url"
    t.integer  "target"
    t.integer  "action"
    t.boolean  "publish"
    t.integer  "order",      default: 0
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.index ["page_id"], name: "index_concourse_navs_on_page_id", using: :btree
    t.index ["project_id"], name: "index_concourse_navs_on_project_id", using: :btree
  end

  create_table "concourse_observations", force: :cascade do |t|
    t.integer  "candidate_id"
    t.text     "content"
    t.integer  "message_type"
    t.integer  "staff_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["candidate_id"], name: "index_concourse_observations_on_candidate_id", using: :btree
    t.index ["staff_id"], name: "index_concourse_observations_on_staff_id", using: :btree
  end

  create_table "concourse_pages", force: :cascade do |t|
    t.integer  "project_id"
    t.string   "title"
    t.text     "content"
    t.boolean  "publish"
    t.string   "slug"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["project_id"], name: "index_concourse_pages_on_project_id", using: :btree
    t.index ["slug"], name: "index_concourse_pages_on_slug", unique: true, using: :btree
  end

  create_table "concourse_projects", force: :cascade do |t|
    t.string   "title"
    t.text     "mini_description"
    t.text     "apresentation"
    t.date     "start"
    t.date     "end"
    t.boolean  "publish",                  default: false
    t.boolean  "status",                   default: false
    t.string   "image_header"
    t.string   "image_logo"
    t.string   "image_footer"
    t.string   "image_slider"
    t.boolean  "slider",                   default: false
    t.boolean  "consultation",             default: false
    t.date     "consultation_start"
    t.date     "consultation_end"
    t.text     "consultation_description"
    t.string   "slug"
    t.integer  "step",                     default: 0
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
    t.text     "slider_html"
    t.date     "start_participation"
    t.date     "end_participation"
    t.text     "text_participation"
    t.string   "result_document"
    t.text     "result_description"
    t.string   "result_date"
    t.boolean  "popup_publish"
    t.string   "popup_title"
    t.text     "popup_content"
    t.date     "result_day"
    t.time     "result_hour"
  end

  create_table "concourse_resources", force: :cascade do |t|
    t.integer  "project_id"
    t.text     "message"
    t.integer  "candidate_id"
    t.integer  "situation",    default: 0
    t.text     "observation"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.index ["candidate_id"], name: "index_concourse_resources_on_candidate_id", using: :btree
    t.index ["project_id"], name: "index_concourse_resources_on_project_id", using: :btree
  end

  create_table "concourse_subscribes", force: :cascade do |t|
    t.integer  "project_id"
    t.string   "title"
    t.boolean  "fee"
    t.integer  "type_guide_id"
    t.date     "start"
    t.date     "end"
    t.boolean  "publish"
    t.text     "observation"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.date     "date_payment"
    t.index ["project_id"], name: "index_concourse_subscribes_on_project_id", using: :btree
    t.index ["type_guide_id"], name: "index_concourse_subscribes_on_type_guide_id", using: :btree
  end

  create_table "concourse_team_participations", force: :cascade do |t|
    t.integer  "candidate_participation_id"
    t.string   "name"
    t.integer  "job"
    t.string   "observation"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.index ["candidate_participation_id"], name: "cand_part_id", using: :btree
  end

  create_table "concourse_user_projects", force: :cascade do |t|
    t.string   "email"
    t.string   "password"
    t.boolean  "status"
    t.integer  "user_type"
    t.integer  "project_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["project_id"], name: "index_concourse_user_projects_on_project_id", using: :btree
  end

  create_table "concourse_winners", force: :cascade do |t|
    t.integer  "participation_id"
    t.integer  "candidate_id"
    t.integer  "position"
    t.integer  "project_id"
    t.integer  "subscribe_id"
    t.integer  "winner_type",         default: 0
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.string   "group_participation"
    t.index ["candidate_id"], name: "index_concourse_winners_on_candidate_id", using: :btree
    t.index ["participation_id"], name: "index_concourse_winners_on_participation_id", using: :btree
    t.index ["project_id"], name: "index_concourse_winners_on_project_id", using: :btree
    t.index ["subscribe_id"], name: "index_concourse_winners_on_subscribe_id", using: :btree
  end

  create_table "contract_additives", force: :cascade do |t|
    t.string   "number"
    t.text     "additive_object"
    t.date     "date_start"
    t.date     "date_end"
    t.decimal  "additive_value",  precision: 10, scale: 2
    t.integer  "additive_type"
    t.integer  "agreement_id"
    t.integer  "staff_id"
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
    t.index ["agreement_id"], name: "index_contract_additives_on_agreement_id", using: :btree
    t.index ["staff_id"], name: "index_contract_additives_on_staff_id", using: :btree
  end

  create_table "contract_agreement_values", force: :cascade do |t|
    t.decimal  "value",                precision: 10, scale: 2
    t.integer  "contract_value_type",                           default: 0
    t.integer  "agreement_id"
    t.text     "observation"
    t.date     "date_agreement_value"
    t.integer  "expense_type_id"
    t.integer  "staff_id"
    t.string   "account"
    t.integer  "group"
    t.string   "invoice"
    t.string   "expense_source"
    t.string   "settlement_note"
    t.string   "creditor"
    t.text     "expense_object"
    t.string   "proc_origin"
    t.string   "proc_payment"
    t.integer  "sector_id"
    t.datetime "created_at",                                                null: false
    t.datetime "updated_at",                                                null: false
    t.index ["agreement_id"], name: "index_contract_agreement_values_on_agreement_id", using: :btree
    t.index ["expense_type_id"], name: "index_contract_agreement_values_on_expense_type_id", using: :btree
    t.index ["sector_id"], name: "index_contract_agreement_values_on_sector_id", using: :btree
    t.index ["staff_id"], name: "index_contract_agreement_values_on_staff_id", using: :btree
  end

  create_table "contract_agreements", force: :cascade do |t|
    t.boolean  "status"
    t.string   "contract_number"
    t.string   "process_number"
    t.string   "contract_name"
    t.text     "observation"
    t.text     "contract_object"
    t.string   "contract_siggo"
    t.date     "date_start"
    t.date     "date_end"
    t.string   "deadline"
    t.decimal  "value_agreement",    precision: 10, scale: 2
    t.integer  "additive_id"
    t.integer  "agreement_value_id"
    t.integer  "bidding_id"
    t.integer  "guarantee_id"
    t.integer  "provider_id"
    t.integer  "sector_id"
    t.integer  "staff_id"
    t.datetime "created_at",                                  null: false
    t.datetime "updated_at",                                  null: false
    t.integer  "warning_one"
    t.integer  "warning_two"
    t.integer  "warning_three"
    t.index ["sector_id"], name: "index_contract_agreements_on_sector_id", using: :btree
    t.index ["staff_id"], name: "index_contract_agreements_on_staff_id", using: :btree
  end

  create_table "contract_biddings", force: :cascade do |t|
    t.string   "name"
    t.boolean  "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "contract_expense_types", force: :cascade do |t|
    t.string   "name"
    t.boolean  "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "contract_expenses", force: :cascade do |t|
    t.integer  "agreement_id"
    t.decimal  "value_commitment", precision: 10, scale: 2
    t.integer  "expense_type_id"
    t.datetime "created_at",                                null: false
    t.datetime "updated_at",                                null: false
    t.index ["agreement_id"], name: "index_contract_expenses_on_agreement_id", using: :btree
    t.index ["expense_type_id"], name: "index_contract_expenses_on_expense_type_id", using: :btree
  end

  create_table "contract_guarantee_types", force: :cascade do |t|
    t.string   "name"
    t.boolean  "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "contract_guarantees", force: :cascade do |t|
    t.string   "guarantee_value"
    t.string   "guarantee_number"
    t.date     "guarantee_date_start"
    t.date     "guarantee_date_end"
    t.integer  "agreement_id"
    t.integer  "guarantee_type_id"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.index ["agreement_id"], name: "index_contract_guarantees_on_agreement_id", using: :btree
    t.index ["guarantee_type_id"], name: "index_contract_guarantees_on_guarantee_type_id", using: :btree
  end

  create_table "contract_providers", force: :cascade do |t|
    t.string   "name"
    t.string   "cnpj"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cpl_control_notice_situations", force: :cascade do |t|
    t.integer  "control_notice_id"
    t.integer  "situation_id"
    t.integer  "staff_id"
    t.text     "observation"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.index ["control_notice_id"], name: "index_cpl_control_notice_situations_on_control_notice_id", using: :btree
    t.index ["situation_id"], name: "index_cpl_control_notice_situations_on_situation_id", using: :btree
    t.index ["staff_id"], name: "index_cpl_control_notice_situations_on_staff_id", using: :btree
  end

  create_table "cpl_control_notices", force: :cascade do |t|
    t.integer  "assessment_id"
    t.text     "object_notice"
    t.string   "number_notice"
    t.integer  "staff_id"
    t.integer  "type_control_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "sector_id"
    t.text     "prediction"
    t.date     "date_edital"
    t.integer  "finalized"
    t.date     "time_finalized"
    t.string   "process"
    t.index ["assessment_id"], name: "index_cpl_control_notices_on_assessment_id", using: :btree
    t.index ["sector_id"], name: "index_cpl_control_notices_on_sector_id", using: :btree
    t.index ["staff_id"], name: "index_cpl_control_notices_on_staff_id", using: :btree
    t.index ["type_control_id"], name: "index_cpl_control_notices_on_type_control_id", using: :btree
  end

  create_table "cpl_situations", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.boolean  "status"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "cpl_trading_floor_participants", force: :cascade do |t|
    t.string   "cnpj"
    t.string   "social_name"
    t.string   "email"
    t.string   "phone"
    t.integer  "trading_floor_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "cpl_trading_floors", force: :cascade do |t|
    t.string   "name"
    t.boolean  "status"
    t.date     "start_date"
    t.date     "end_date"
    t.string   "attachment"
    t.text     "description"
    t.integer  "trading_floor_type"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  create_table "cpl_type_controls", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.boolean  "status"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "dashboard_panics", force: :cascade do |t|
    t.integer  "station_id"
    t.integer  "staff_id"
    t.boolean  "panic"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "dashboard_station_controls", force: :cascade do |t|
    t.integer  "station_id"
    t.datetime "date"
    t.integer  "staff_id"
    t.string   "lat"
    t.string   "lng"
    t.string   "mac"
    t.string   "message"
    t.integer  "situation_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.string   "justify"
  end

  create_table "document_allotments", force: :cascade do |t|
    t.integer  "template_id"
    t.integer  "staff_id"
    t.boolean  "status"
    t.datetime "data_document"
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
    t.boolean  "signature"
    t.string   "property_value"
    t.integer  "allotment_type"
    t.integer  "main_authenticate_id"
    t.boolean  "main_authenticate",        default: false
    t.datetime "main_authenticate_date"
    t.integer  "first_authenticate_id"
    t.boolean  "first_authenticate",       default: false
    t.datetime "first_authenticate_date"
    t.integer  "second_authenticate_id"
    t.boolean  "second_authenticate",      default: false
    t.datetime "second_authenticate_date"
    t.boolean  "print",                    default: false
    t.integer  "third_authenticate_id"
    t.boolean  "third_authenticate",       default: false
    t.date     "third_authenticate_date"
    t.integer  "fourth_authenticate_id"
    t.boolean  "fourth_authenticate",      default: false
    t.date     "fourth_authenticate_date"
    t.integer  "fifth_authenticate_id"
    t.boolean  "fifth_authenticate",       default: false
    t.date     "fifth_authenticate_date"
    t.boolean  "terracap",                 default: false
    t.boolean  "rubric"
    t.index ["staff_id"], name: "index_document_allotments_on_staff_id", using: :btree
    t.index ["template_id"], name: "index_document_allotments_on_template_id", using: :btree
  end

  create_table "document_assistant_allotment_subscribers", force: :cascade do |t|
    t.integer  "allotment_id"
    t.integer  "subscriber_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "document_assistant_allotments", force: :cascade do |t|
    t.integer  "template_id"
    t.integer  "index"
    t.string   "file_path"
    t.date     "data_document"
    t.integer  "staff_id"
    t.boolean  "status"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "document_assistant_pages", force: :cascade do |t|
    t.integer  "template_id"
    t.text     "content"
    t.string   "title"
    t.boolean  "status"
    t.boolean  "last_page"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "document_assistant_subscriber_templates", force: :cascade do |t|
    t.integer  "subscriber_id"
    t.integer  "template_id"
    t.boolean  "status"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "document_assistant_subscribers", force: :cascade do |t|
    t.string   "name"
    t.string   "title"
    t.string   "rubric_path"
    t.string   "subscriber_path"
    t.string   "custom_label"
    t.string   "custom_field"
    t.boolean  "status"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "document_assistant_templates", force: :cascade do |t|
    t.string   "name"
    t.boolean  "status"
    t.string   "shortcode"
    t.text     "validator"
    t.string   "shortcode_index"
    t.integer  "total_subscription"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  create_table "document_data_prints", force: :cascade do |t|
    t.integer  "allotment_id"
    t.string   "name"
    t.string   "cpf"
    t.string   "nationality"
    t.string   "employment"
    t.integer  "civil_state_id"
    t.string   "rg"
    t.string   "rg_org"
    t.string   "rg_uf"
    t.string   "document_number"
    t.string   "wedding_regime"
    t.string   "wedding_date"
    t.string   "spouse_name"
    t.string   "spouse_cpf"
    t.string   "spouse_nationality"
    t.string   "spouse_employment"
    t.integer  "spouse_civil_state_id"
    t.string   "spouse_rg"
    t.string   "spouse_rg_org"
    t.string   "spouse_rg_uf"
    t.integer  "city_id"
    t.integer  "ownership_type_id"
    t.string   "complete_address"
    t.datetime "ocupation"
    t.string   "unit_code"
    t.string   "office"
    t.string   "registration_iptu"
    t.string   "declaratory_act_number"
    t.string   "certificate_sefaz"
    t.string   "date_certificate_sefaz"
    t.string   "validate_certificate_sefaz"
    t.integer  "staff_id"
    t.boolean  "status"
    t.text     "messages"
    t.string   "endorsement"
    t.datetime "date_act_declaratory"
    t.string   "address_data_base"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.string   "area"
    t.boolean  "spouse_signature"
    t.boolean  "cancelled"
    t.string   "married"
    t.string   "property_value"
    t.text     "correction"
    t.string   "authenticate"
    t.string   "mother_name"
    t.string   "father_name"
    t.string   "spouse_mother_name"
    t.string   "spouse_father_name"
    t.boolean  "rectification"
    t.boolean  "ready_rectification"
    t.string   "observation_rectification"
    t.text     "procuration"
    t.index ["allotment_id"], name: "index_document_data_prints_on_allotment_id", using: :btree
    t.index ["city_id"], name: "index_document_data_prints_on_city_id", using: :btree
    t.index ["civil_state_id"], name: "index_document_data_prints_on_civil_state_id", using: :btree
    t.index ["ownership_type_id"], name: "index_document_data_prints_on_ownership_type_id", using: :btree
    t.index ["spouse_civil_state_id"], name: "index_document_data_prints_on_spouse_civil_state_id", using: :btree
    t.index ["staff_id"], name: "index_document_data_prints_on_staff_id", using: :btree
  end

  create_table "document_logs", force: :cascade do |t|
    t.integer  "staff_id"
    t.integer  "data_print_id"
    t.text     "observation"
    t.text     "page_one"
    t.text     "page_two"
    t.text     "page_three"
    t.text     "header"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "document_templates", force: :cascade do |t|
    t.string   "name"
    t.string   "title"
    t.text     "header"
    t.text     "page_one"
    t.text     "page_two"
    t.text     "page_three"
    t.integer  "page_number"
    t.string   "main_signature"
    t.string   "main_complement"
    t.string   "first_signature"
    t.string   "first_complement"
    t.string   "second_signature"
    t.string   "second_complement"
    t.integer  "staff_id"
    t.boolean  "status"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.string   "text_font_size"
    t.string   "head_font_size"
    t.index ["staff_id"], name: "index_document_templates_on_staff_id", using: :btree
  end

  create_table "entity_allotment_entities", force: :cascade do |t|
    t.integer  "allotment_id"
    t.integer  "quantity"
    t.integer  "entity_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "entity_allotment_units", force: :cascade do |t|
    t.integer  "allotment_id"
    t.integer  "unit_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "entity_allotments", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "situation",   default: 0
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "entity_cadastres", force: :cascade do |t|
    t.string   "cnpj"
    t.string   "name"
    t.string   "fantasy_name"
    t.string   "telephone"
    t.string   "telephone_optional"
    t.string   "email"
    t.string   "celphone"
    t.string   "address"
    t.string   "number"
    t.string   "complement"
    t.string   "cep"
    t.integer  "city_id"
    t.text     "observation"
    t.boolean  "status",             default: true
    t.string   "password"
    t.string   "reset_token"
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.string   "lat"
    t.string   "lng"
    t.boolean  "interest"
    t.date     "date_constitution"
    t.index ["city_id"], name: "index_entity_cadastres_on_city_id", using: :btree
    t.index ["cnpj"], name: "index_entity_cadastres_on_cnpj", unique: true, using: :btree
  end

  create_table "entity_candidates", force: :cascade do |t|
    t.integer  "candidate_id"
    t.integer  "cadastre_id"
    t.boolean  "status"
    t.date     "date_in"
    t.date     "date_out"
    t.text     "observation"
    t.string   "document"
    t.boolean  "accepted"
    t.datetime "date_accepted"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["cadastre_id"], name: "index_entity_candidates_on_cadastre_id", using: :btree
    t.index ["candidate_id"], name: "index_entity_candidates_on_candidate_id", using: :btree
  end

  create_table "entity_chat_categories", force: :cascade do |t|
    t.string   "name"
    t.boolean  "status",     default: true
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "entity_chat_comments", force: :cascade do |t|
    t.integer  "chat_id"
    t.text     "content"
    t.integer  "staff_id"
    t.boolean  "entity",               default: true
    t.boolean  "entity_read",          default: false
    t.datetime "entity_read_datetime"
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
  end

  create_table "entity_chat_uploads", force: :cascade do |t|
    t.integer  "chat_comment_id"
    t.string   "document"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "entity_chats", force: :cascade do |t|
    t.integer  "chat_category_id"
    t.integer  "entity_id"
    t.boolean  "closed",           default: false
    t.text     "close_comment"
    t.boolean  "close_candidate",  default: false
    t.integer  "close_staff_id"
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
  end

  create_table "entity_document_categories", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "code"
    t.boolean  "required",      default: false
    t.integer  "document_type", default: 0
    t.boolean  "status",        default: true
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.index ["code"], name: "index_entity_document_categories_on_code", unique: true, using: :btree
  end

  create_table "entity_documents", force: :cascade do |t|
    t.string   "archive_path"
    t.integer  "document_category_id"
    t.integer  "cadastre_id"
    t.integer  "cadastre_mirror_id"
    t.text     "observation"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.integer  "old_id"
    t.index ["cadastre_id"], name: "index_entity_documents_on_cadastre_id", using: :btree
    t.index ["cadastre_mirror_id"], name: "index_entity_documents_on_cadastre_mirror_id", using: :btree
    t.index ["document_category_id"], name: "index_entity_documents_on_document_category_id", using: :btree
  end

  create_table "entity_enterprise_cadastres", force: :cascade do |t|
    t.integer  "cadastre_id"
    t.integer  "enterprise_id"
    t.boolean  "status",        default: true
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  create_table "entity_enterprises", force: :cascade do |t|
    t.string   "complete_address"
    t.string   "document_number"
    t.string   "name"
    t.string   "group_name"
    t.integer  "entity_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "entity_events", force: :cascade do |t|
    t.string   "name"
    t.date     "date"
    t.text     "description"
    t.text     "content"
    t.integer  "situation"
    t.string   "photo"
    t.boolean  "status"
    t.string   "district"
    t.integer  "city_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["city_id"], name: "index_entity_events_on_city_id", using: :btree
  end

  create_table "entity_indication_logs", force: :cascade do |t|
    t.integer  "entity_id"
    t.integer  "unit_id"
    t.integer  "cadastre_id"
    t.integer  "indication_unit_id"
    t.text     "description"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  create_table "entity_indication_units", force: :cascade do |t|
    t.integer  "entity_id"
    t.integer  "cadastre_id"
    t.integer  "allotment_id"
    t.integer  "unit_id"
    t.integer  "situation",    default: 0
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "entity_interests", force: :cascade do |t|
    t.integer  "entity_id"
    t.integer  "unit_sale_id"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.text     "unit_sale_ids",                             array: true
    t.integer  "allotment_id"
    t.boolean  "presence",      default: true
    t.index ["entity_id"], name: "index_entity_interests_on_entity_id", using: :btree
    t.index ["unit_sale_id"], name: "index_entity_interests_on_unit_sale_id", using: :btree
  end

  create_table "entity_member_additionals", force: :cascade do |t|
    t.string   "cnpj"
    t.string   "social_reason"
    t.integer  "member_job_id"
    t.date     "start"
    t.date     "end"
    t.integer  "member_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["member_id"], name: "index_entity_member_additionals_on_member_id", using: :btree
    t.index ["member_job_id"], name: "index_entity_member_additionals_on_member_job_id", using: :btree
  end

  create_table "entity_member_jobs", force: :cascade do |t|
    t.string   "name"
    t.integer  "code"
    t.boolean  "status",     default: true
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.index ["code"], name: "index_entity_member_jobs_on_code", unique: true, using: :btree
  end

  create_table "entity_members", force: :cascade do |t|
    t.integer  "cadastre_id"
    t.string   "name"
    t.string   "cpf"
    t.string   "rg"
    t.string   "rg_org"
    t.string   "address"
    t.integer  "city_id"
    t.string   "cep"
    t.string   "email"
    t.date     "start"
    t.date     "end"
    t.date     "born"
    t.string   "telephone"
    t.string   "telephone_optional"
    t.string   "celphone"
    t.string   "certificate_civil_criminal"
    t.string   "photo"
    t.boolean  "status",                     default: true
    t.integer  "member_job_id"
    t.datetime "created_at",                                null: false
    t.datetime "updated_at",                                null: false
    t.index ["cadastre_id"], name: "index_entity_members_on_cadastre_id", using: :btree
    t.index ["city_id"], name: "index_entity_members_on_city_id", using: :btree
    t.index ["cpf", "cadastre_id"], name: "index_entity_members_on_cpf_and_cadastre_id", unique: true, using: :btree
    t.index ["member_job_id"], name: "index_entity_members_on_member_job_id", using: :btree
  end

  create_table "entity_messages", force: :cascade do |t|
    t.integer  "cadastre_id"
    t.text     "content"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["cadastre_id"], name: "index_entity_messages_on_cadastre_id", using: :btree
  end

  create_table "entity_occurrence_categories", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.boolean  "status",      default: true
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "entity_occurrences", force: :cascade do |t|
    t.integer  "cadastre_id"
    t.integer  "category_id"
    t.text     "description"
    t.boolean  "solved",             default: false
    t.text     "solved_description"
    t.integer  "solved_user_id"
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
    t.index ["cadastre_id"], name: "index_entity_occurrences_on_cadastre_id", using: :btree
    t.index ["category_id"], name: "index_entity_occurrences_on_category_id", using: :btree
    t.index ["solved_user_id"], name: "index_entity_occurrences_on_solved_user_id", using: :btree
  end

  create_table "entity_old_candidates", force: :cascade do |t|
    t.integer  "old_id"
    t.integer  "cadastre_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["cadastre_id"], name: "index_entity_old_candidates_on_cadastre_id", using: :btree
    t.index ["old_id"], name: "index_entity_old_candidates_on_old_id", using: :btree
  end

  create_table "entity_olds", force: :cascade do |t|
    t.string   "name"
    t.string   "fantasy_name"
    t.string   "cnpj"
    t.string   "president_name"
    t.string   "president_cpf"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.string   "old"
    t.string   "address"
    t.string   "cep"
    t.boolean  "pf_problem"
    t.string   "city"
    t.string   "lat"
    t.string   "long"
    t.string   "telephone"
    t.string   "email"
    t.string   "password"
    t.integer  "city_id"
  end

  create_table "entity_project_raffle_entities", force: :cascade do |t|
    t.integer  "raffle_id"
    t.integer  "project_unit_id"
    t.integer  "entity_id"
    t.integer  "staff_id"
    t.integer  "situation",       default: 0
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  create_table "entity_project_raffles", force: :cascade do |t|
    t.string   "name"
    t.integer  "project_id"
    t.integer  "quantity",   default: 0
    t.integer  "situation",  default: 0
    t.integer  "staff_id"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "entity_project_units", force: :cascade do |t|
    t.string   "name"
    t.integer  "project_id"
    t.integer  "unit_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "entity_projects", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "city_id"
    t.integer  "units"
    t.integer  "units_type",  default: 0
    t.integer  "staff_id"
    t.integer  "situation",   default: 0
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "entity_provisonal_candidates", force: :cascade do |t|
    t.integer  "candidate_id"
    t.integer  "entity_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "entity_raffle_results", force: :cascade do |t|
    t.integer  "entity_id"
    t.integer  "unit_sale_id"
    t.integer  "allotment_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "entity_realties", force: :cascade do |t|
    t.integer  "cadastre_id"
    t.integer  "cadastre_mirror_id"
    t.string   "address"
    t.integer  "city_id"
    t.string   "complement"
    t.string   "number"
    t.string   "burgh"
    t.string   "observation"
    t.integer  "situation"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.index ["cadastre_id"], name: "index_entity_realties_on_cadastre_id", using: :btree
    t.index ["cadastre_mirror_id"], name: "index_entity_realties_on_cadastre_mirror_id", using: :btree
    t.index ["city_id"], name: "index_entity_realties_on_city_id", using: :btree
  end

  create_table "entity_regions", force: :cascade do |t|
    t.string   "name"
    t.string   "region_name"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "entity_situation_statuses", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "code"
    t.boolean  "status",      default: true
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.index ["code"], name: "index_entity_situation_statuses_on_code", unique: true, using: :btree
  end

  create_table "entity_situations", force: :cascade do |t|
    t.integer  "cadastre_id"
    t.integer  "situation_status_id"
    t.text     "observation"
    t.integer  "staff_id"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.index ["cadastre_id"], name: "index_entity_situations_on_cadastre_id", using: :btree
    t.index ["situation_status_id"], name: "index_entity_situations_on_situation_status_id", using: :btree
    t.index ["staff_id"], name: "index_entity_situations_on_staff_id", using: :btree
  end

  create_table "entity_sliders", force: :cascade do |t|
    t.string   "title"
    t.string   "photo"
    t.boolean  "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "entity_surveys", force: :cascade do |t|
    t.integer  "cadastre_id"
    t.integer  "situation"
    t.string   "address"
    t.string   "number"
    t.integer  "city_id"
    t.integer  "property_type"
    t.integer  "property_size"
    t.integer  "property_structure"
    t.string   "property_owner"
    t.integer  "property_occupied"
    t.text     "property_description"
    t.text     "property_entities"
    t.string   "operation_time"
    t.string   "property_time"
    t.string   "reunions_frequency"
    t.date     "date_election_president"
    t.string   "operation_area"
    t.integer  "members_count"
    t.string   "operation_hour"
    t.string   "operation_days"
    t.string   "representation_job_codhab"
    t.string   "representation_name"
    t.string   "representation_cpf"
    t.string   "representation_rg"
    t.integer  "representation_job"
    t.integer  "representation_telephone"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.index ["cadastre_id"], name: "index_entity_surveys_on_cadastre_id", using: :btree
  end

  create_table "entity_unit_sales", force: :cascade do |t|
    t.integer  "city_id"
    t.string   "address"
    t.string   "area"
    t.string   "dimensions"
    t.string   "appraisal_value"
    t.string   "subsidy_value"
    t.string   "final_value"
    t.boolean  "status"
    t.integer  "staff_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "raffle_id"
    t.integer  "winner_id"
    t.index ["city_id"], name: "index_entity_unit_sales_on_city_id", using: :btree
    t.index ["staff_id"], name: "index_entity_unit_sales_on_staff_id", using: :btree
  end

  create_table "entity_validate_documents", force: :cascade do |t|
    t.string   "cnpj"
    t.boolean  "status"
    t.date     "document_date"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "environment_licenses", force: :cascade do |t|
    t.string   "title"
    t.date     "start_date"
    t.date     "end_date"
    t.integer  "staff_id"
    t.text     "observation"
    t.integer  "enterprise_id"
    t.string   "responsible"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.string   "enterprise_name"
    t.boolean  "status",          default: true
  end

  create_table "external_firm_cadastres", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "name"
    t.string   "cpf"
    t.string   "rg"
    t.string   "telephone"
    t.string   "celphone"
    t.integer  "city_id"
    t.string   "address"
    t.text     "observation"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "external_firm_users", force: :cascade do |t|
    t.string   "name"
    t.string   "company"
    t.string   "email"
    t.string   "password"
    t.boolean  "status",     default: true
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "helpdesk_ticket_attendants", force: :cascade do |t|
    t.integer  "ticket_type_id"
    t.integer  "staff_id"
    t.boolean  "status"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["staff_id"], name: "index_helpdesk_ticket_attendants_on_staff_id", using: :btree
    t.index ["ticket_type_id"], name: "index_helpdesk_ticket_attendants_on_ticket_type_id", using: :btree
  end

  create_table "helpdesk_ticket_ocurrences", force: :cascade do |t|
    t.integer  "ticket_id"
    t.integer  "staff_id"
    t.integer  "responsible_id"
    t.text     "ocurrence"
    t.integer  "ticket_solution_id"
    t.datetime "solution_date"
    t.datetime "scheduled_date"
    t.boolean  "scheduled"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "file_ocurrence"
    t.index ["responsible_id"], name: "index_helpdesk_ticket_ocurrences_on_responsible_id", using: :btree
    t.index ["staff_id"], name: "index_helpdesk_ticket_ocurrences_on_staff_id", using: :btree
    t.index ["ticket_id"], name: "index_helpdesk_ticket_ocurrences_on_ticket_id", using: :btree
    t.index ["ticket_solution_id"], name: "index_helpdesk_ticket_ocurrences_on_ticket_solution_id", using: :btree
  end

  create_table "helpdesk_ticket_solutions", force: :cascade do |t|
    t.integer  "ticket_type_id"
    t.string   "title"
    t.text     "description"
    t.boolean  "status"
    t.string   "solution_sla"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["ticket_type_id"], name: "index_helpdesk_ticket_solutions_on_ticket_type_id", using: :btree
  end

  create_table "helpdesk_ticket_subjects", force: :cascade do |t|
    t.integer  "ticket_type_id"
    t.string   "title"
    t.text     "description"
    t.boolean  "status"
    t.string   "subject_sla"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["ticket_type_id"], name: "index_helpdesk_ticket_subjects_on_ticket_type_id", using: :btree
  end

  create_table "helpdesk_ticket_types", force: :cascade do |t|
    t.integer  "sector_id"
    t.string   "title"
    t.text     "description"
    t.boolean  "status"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["sector_id"], name: "index_helpdesk_ticket_types_on_sector_id", using: :btree
  end

  create_table "helpdesk_tickets", force: :cascade do |t|
    t.integer  "ticket_type_id"
    t.integer  "requester_id"
    t.integer  "attendant_id"
    t.integer  "ticket_subject_id"
    t.integer  "sector_id"
    t.datetime "attendance_start"
    t.datetime "attendance_end"
    t.datetime "deadline"
    t.integer  "status",            default: 0
    t.text     "description"
    t.text     "meta_tags"
    t.string   "code_computer"
    t.string   "file_path"
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.string   "branch_line"
    t.integer  "station_id"
    t.date     "date"
    t.string   "hour"
    t.index ["attendant_id"], name: "index_helpdesk_tickets_on_attendant_id", using: :btree
    t.index ["requester_id"], name: "index_helpdesk_tickets_on_requester_id", using: :btree
    t.index ["sector_id"], name: "index_helpdesk_tickets_on_sector_id", using: :btree
    t.index ["ticket_subject_id"], name: "index_helpdesk_tickets_on_ticket_subject_id", using: :btree
    t.index ["ticket_type_id"], name: "index_helpdesk_tickets_on_ticket_type_id", using: :btree
  end

  create_table "indication_allotments", force: :cascade do |t|
    t.integer  "step_id"
    t.integer  "zone"
    t.integer  "demand"
    t.integer  "rii"
    t.integer  "rie"
    t.integer  "old"
    t.integer  "special"
    t.integer  "vulnerable"
    t.integer  "situation",     default: 0
    t.integer  "staff_id"
    t.integer  "supervisor_id"
    t.text     "observation"
    t.boolean  "status"
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.decimal  "initial_value"
    t.decimal  "end_value"
    t.string   "ticket"
    t.boolean  "entity",        default: false
    t.boolean  "indicated",     default: false
    t.integer  "city_id"
    t.index ["staff_id"], name: "index_indication_allotments_on_staff_id", using: :btree
    t.index ["step_id"], name: "index_indication_allotments_on_step_id", using: :btree
    t.index ["supervisor_id"], name: "index_indication_allotments_on_supervisor_id", using: :btree
    t.index ["zone"], name: "index_indication_allotments_on_zone", using: :btree
  end

  create_table "indication_cadastres", force: :cascade do |t|
    t.integer  "allotment_id"
    t.integer  "cadastre_id"
    t.integer  "program_id"
    t.integer  "pontuation_id"
    t.integer  "situation",     default: 0
    t.string   "observation"
    t.string   "source_list"
    t.integer  "zone_id"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.index ["allotment_id"], name: "index_indication_cadastres_on_allotment_id", using: :btree
    t.index ["cadastre_id"], name: "index_indication_cadastres_on_cadastre_id", using: :btree
    t.index ["pontuation_id"], name: "index_indication_cadastres_on_pontuation_id", using: :btree
    t.index ["program_id"], name: "index_indication_cadastres_on_program_id", using: :btree
    t.index ["zone_id"], name: "index_indication_cadastres_on_zone_id", using: :btree
  end

  create_table "indication_situations", force: :cascade do |t|
    t.string   "name"
    t.boolean  "status",     default: true
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "indication_types", force: :cascade do |t|
    t.string   "name"
    t.boolean  "status",     default: true
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "juridical_advice_types", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.boolean  "status"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "juridical_complainants", force: :cascade do |t|
    t.string   "name"
    t.integer  "staff_id"
    t.integer  "legal_advice_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["legal_advice_id"], name: "index_juridical_complainants_on_legal_advice_id", using: :btree
    t.index ["staff_id"], name: "index_juridical_complainants_on_staff_id", using: :btree
  end

  create_table "juridical_complements", force: :cascade do |t|
    t.integer  "document_type_id"
    t.integer  "lawsuit_id"
    t.integer  "instancy_place_id"
    t.date     "distribution_date"
    t.date     "deadline"
    t.integer  "days"
    t.date     "end_date"
    t.text     "complement"
    t.integer  "responsible_lawyer_id"
    t.integer  "advice_type_id"
    t.string   "file_path"
    t.boolean  "status"
    t.integer  "complement_father_id"
    t.integer  "legal_advice_id"
    t.integer  "staff_id"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.index ["advice_type_id"], name: "index_juridical_complements_on_advice_type_id", using: :btree
    t.index ["complement_father_id"], name: "index_juridical_complements_on_complement_father_id", using: :btree
    t.index ["document_type_id"], name: "index_juridical_complements_on_document_type_id", using: :btree
    t.index ["instancy_place_id"], name: "index_juridical_complements_on_instancy_place_id", using: :btree
    t.index ["lawsuit_id"], name: "index_juridical_complements_on_lawsuit_id", using: :btree
    t.index ["legal_advice_id"], name: "index_juridical_complements_on_legal_advice_id", using: :btree
    t.index ["responsible_lawyer_id"], name: "index_juridical_complements_on_responsible_lawyer_id", using: :btree
    t.index ["staff_id"], name: "index_juridical_complements_on_staff_id", using: :btree
  end

  create_table "juridical_defendants", force: :cascade do |t|
    t.string   "name"
    t.integer  "staff_id"
    t.integer  "legal_advice_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["legal_advice_id"], name: "index_juridical_defendants_on_legal_advice_id", using: :btree
    t.index ["staff_id"], name: "index_juridical_defendants_on_staff_id", using: :btree
  end

  create_table "juridical_instancies", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.boolean  "status"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "juridical_instancy_places", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.boolean  "status"
    t.integer  "instancy_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["instancy_id"], name: "index_juridical_instancy_places_on_instancy_id", using: :btree
  end

  create_table "juridical_lawsuits", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.boolean  "status"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "juridical_legal_advices", force: :cascade do |t|
    t.string   "process_number"
    t.string   "agency"
    t.integer  "lawsuit_id"
    t.decimal  "lawsuit_value"
    t.integer  "instancy_place_id"
    t.integer  "document_type_id"
    t.integer  "responsible_lawyer_id"
    t.text     "description_complement"
    t.boolean  "status"
    t.date     "start_date"
    t.date     "end_date"
    t.integer  "process_type"
    t.string   "suitor"
    t.boolean  "verdict"
    t.decimal  "condemnation_value"
    t.string   "assessment_number"
    t.integer  "staff_id"
    t.integer  "old_id"
    t.integer  "advice_type_id"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.boolean  "free_justice"
    t.integer  "probability"
    t.decimal  "procedural_costs"
    t.decimal  "judicial_deposit"
    t.index ["advice_type_id"], name: "index_juridical_legal_advices_on_advice_type_id", using: :btree
    t.index ["document_type_id"], name: "index_juridical_legal_advices_on_document_type_id", using: :btree
    t.index ["instancy_place_id"], name: "index_juridical_legal_advices_on_instancy_place_id", using: :btree
    t.index ["lawsuit_id"], name: "index_juridical_legal_advices_on_lawsuit_id", using: :btree
    t.index ["old_id"], name: "index_juridical_legal_advices_on_old_id", using: :btree
    t.index ["responsible_lawyer_id"], name: "index_juridical_legal_advices_on_responsible_lawyer_id", using: :btree
    t.index ["staff_id"], name: "index_juridical_legal_advices_on_staff_id", using: :btree
  end

  create_table "lecture_course_classe_staffs", force: :cascade do |t|
    t.integer  "course_classe_id"
    t.integer  "student_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.index ["course_classe_id"], name: "index_lecture_course_classe_staffs_on_course_classe_id", using: :btree
    t.index ["student_id"], name: "index_lecture_course_classe_staffs_on_student_id", using: :btree
  end

  create_table "lecture_course_classes", force: :cascade do |t|
    t.integer  "day"
    t.integer  "vacancies"
    t.string   "start_hour"
    t.string   "end_hour"
    t.boolean  "status"
    t.integer  "course_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["course_id"], name: "index_lecture_course_classes_on_course_id", using: :btree
  end

  create_table "lecture_courses", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.boolean  "status"
    t.integer  "type_course_id"
    t.datetime "start_date"
    t.datetime "end_date"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["type_course_id"], name: "index_lecture_courses_on_type_course_id", using: :btree
  end

  create_table "lecture_type_courses", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.boolean  "status"
    t.integer  "staff_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["staff_id"], name: "index_lecture_type_courses_on_staff_id", using: :btree
  end

  create_table "lifting_machine_borroweds", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.boolean  "status"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "lifting_machine_computers", force: :cascade do |t|
    t.string   "tag"
    t.integer  "sector_id"
    t.integer  "equipment_id"
    t.integer  "responsible_id"
    t.integer  "borrowed_id"
    t.string   "monitor1"
    t.string   "keyboard"
    t.string   "mouse"
    t.boolean  "external_allocation"
    t.string   "tag_monitor2"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "responsible2"
    t.index ["borrowed_id"], name: "index_lifting_machine_computers_on_borrowed_id", using: :btree
    t.index ["equipment_id"], name: "index_lifting_machine_computers_on_equipment_id", using: :btree
    t.index ["responsible_id"], name: "index_lifting_machine_computers_on_responsible_id", using: :btree
    t.index ["sector_id"], name: "index_lifting_machine_computers_on_sector_id", using: :btree
  end

  create_table "lifting_machine_equipments", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.boolean  "status"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "main_action_permissions", force: :cascade do |t|
    t.string   "action"
    t.string   "code"
    t.boolean  "status"
    t.integer  "system_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["code"], name: "index_main_action_permissions_on_code", unique: true, using: :btree
    t.index ["system_id"], name: "index_main_action_permissions_on_system_id", using: :btree
  end

  create_table "main_action_sliders", force: :cascade do |t|
    t.string   "thumbnail"
    t.string   "title"
    t.boolean  "status"
    t.integer  "order"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "main_bsb_habitations", force: :cascade do |t|
    t.string   "title"
    t.string   "result_1"
    t.string   "result_2"
    t.string   "result_3"
    t.string   "result_4"
    t.string   "result_5"
    t.string   "result_6"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "main_configs", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "code"
    t.boolean  "status",      default: false
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  create_table "main_emails", force: :cascade do |t|
    t.string   "email"
    t.boolean  "validation",  default: true
    t.integer  "template_id"
    t.integer  "user_id"
    t.boolean  "sended",      default: false
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  create_table "main_events", force: :cascade do |t|
    t.text     "resume"
    t.text     "content"
    t.integer  "type_event_id"
    t.date     "date_publish"
    t.string   "title"
    t.string   "file_path"
    t.boolean  "status"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "main_galleries", force: :cascade do |t|
    t.string   "title"
    t.text     "content"
    t.boolean  "status"
    t.string   "thumbnail"
    t.string   "photo",        default: [],              array: true
    t.date     "date_publish"
    t.boolean  "private"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "main_nav_categories", force: :cascade do |t|
    t.string   "name"
    t.boolean  "status"
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "main_navs", force: :cascade do |t|
    t.string   "name"
    t.integer  "target"
    t.integer  "order"
    t.string   "link_external"
    t.integer  "type_nav"
    t.integer  "link_page_id"
    t.integer  "link_post_id"
    t.boolean  "publish"
    t.integer  "category_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["category_id"], name: "index_main_navs_on_category_id", using: :btree
    t.index ["father_id"], name: "index_main_navs_on_father_id", using: :btree
    t.index ["link_page_id"], name: "index_main_navs_on_link_page_id", using: :btree
    t.index ["link_post_id"], name: "index_main_navs_on_link_post_id", using: :btree
  end

  create_table "main_navs", force: :cascade do |t|
    t.string   "name"
    t.integer  "target"
    t.integer  "order"
    t.string   "link_external"
    t.integer  "type_nav"
    t.integer  "link_page_id"
    t.integer  "link_post_id"
    t.boolean  "publish"
    t.integer  "category_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["category_id"], name: "index_main_navs_on_category_id", using: :btree
    t.index ["father_id"], name: "index_main_navs_on_father_id", using: :btree
    t.index ["link_page_id"], name: "index_main_navs_on_link_page_id", using: :btree
    t.index ["link_post_id"], name: "index_main_navs_on_link_post_id", using: :btree
  end

  create_table "main_page_categories", force: :cascade do |t|
    t.string   "title"
    t.boolean  "status"
    t.string   "code"
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "main_page_categories", force: :cascade do |t|
    t.string   "title"
    t.boolean  "status"
    t.string   "code"
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "main_pages", force: :cascade do |t|
    t.string   "title"
    t.text     "content"
    t.date     "date_publish"
    t.boolean  "publish"
    t.string   "thumb"
    t.string   "photo_author"
    t.string   "photo_description"
    t.boolean  "active_photo"
    t.string   "author"
    t.string   "link"
    t.string   "thumbnail"
    t.string   "label_link"
    t.string   "slug"
    t.integer  "page_category_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.string   "report"
    t.index ["page_category_id"], name: "index_main_pages_on_page_category_id", using: :btree
    t.index ["page_category_id"], name: "index_main_pages_on_page_category_id", using: :btree
  end

  create_table "main_pages", force: :cascade do |t|
    t.string   "title"
    t.text     "content"
    t.date     "date_publish"
    t.boolean  "publish"
    t.string   "thumb"
    t.string   "photo_author"
    t.string   "photo_description"
    t.boolean  "active_photo"
    t.string   "author"
    t.string   "link"
    t.string   "thumbnail"
    t.string   "label_link"
    t.string   "slug"
    t.integer  "page_category_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.string   "report"
    t.index ["page_category_id"], name: "index_main_pages_on_page_category_id", using: :btree
    t.index ["page_category_id"], name: "index_main_pages_on_page_category_id", using: :btree
  end

  create_table "main_permission_groups", force: :cascade do |t|
    t.string   "name"
    t.text     "code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "main_post_categories", force: :cascade do |t|
    t.string   "title"
    t.boolean  "status"
    t.string   "code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "main_post_categories", force: :cascade do |t|
    t.string   "title"
    t.boolean  "status"
    t.string   "code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "main_posts", force: :cascade do |t|
    t.string   "title"
    t.text     "resume"
    t.text     "content"
    t.date     "date"
    t.boolean  "publish"
    t.boolean  "slider"
    t.string   "thumb"
    t.string   "photo_author"
    t.string   "photo_description"
    t.boolean  "active_photo"
    t.string   "author"
    t.string   "link"
    t.integer  "post_category_id"
    t.string   "thumbnail"
    t.string   "label_link"
    t.string   "flickr"
    t.string   "color"
    t.integer  "local_post"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.index ["post_category_id"], name: "index_main_posts_on_post_category_id", using: :btree
    t.index ["post_category_id"], name: "index_main_posts_on_post_category_id", using: :btree
  end

  create_table "main_posts", force: :cascade do |t|
    t.string   "title"
    t.text     "resume"
    t.text     "content"
    t.date     "date"
    t.boolean  "publish"
    t.boolean  "slider"
    t.string   "thumb"
    t.string   "photo_author"
    t.string   "photo_description"
    t.boolean  "active_photo"
    t.string   "author"
    t.string   "link"
    t.integer  "post_category_id"
    t.string   "thumbnail"
    t.string   "label_link"
    t.string   "flickr"
    t.string   "color"
    t.integer  "local_post"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.index ["post_category_id"], name: "index_main_posts_on_post_category_id", using: :btree
    t.index ["post_category_id"], name: "index_main_posts_on_post_category_id", using: :btree
  end

  create_table "main_service_results", force: :cascade do |t|
    t.integer  "program_morarbem"
    t.integer  "regularization"
    t.integer  "contract"
    t.integer  "ombudsman"
    t.integer  "protocol"
    t.date     "date"
    t.boolean  "status"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "main_systems", force: :cascade do |t|
    t.string   "name"
    t.string   "code"
    t.boolean  "status"
    t.integer  "nav_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["nav_id"], name: "index_main_systems_on_nav_id", using: :btree
  end

  create_table "main_templates", force: :cascade do |t|
    t.string   "subject"
    t.text     "content"
    t.string   "sender"
    t.string   "confirmed"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "main_type_events", force: :cascade do |t|
    t.string   "name"
    t.boolean  "status"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "main_user_permission_groups", force: :cascade do |t|
    t.integer  "staff_id"
    t.integer  "permission_group_id"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.index ["permission_group_id"], name: "index_main_user_permission_groups_on_permission_group_id", using: :btree
    t.index ["staff_id"], name: "index_main_user_permission_groups_on_staff_id", using: :btree
  end

  create_table "main_user_permissions", force: :cascade do |t|
    t.integer  "staff_id"
    t.integer  "action_permission_id"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.index ["action_permission_id"], name: "index_main_user_permissions_on_action_permission_id", using: :btree
    t.index ["staff_id"], name: "index_main_user_permissions_on_staff_id", using: :btree
  end

  create_table "main_videos", force: :cascade do |t|
    t.string   "title"
    t.string   "url"
    t.integer  "position"
    t.boolean  "publish"
    t.text     "description"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.integer  "post_category_id"
  end

  create_table "manager_activities", force: :cascade do |t|
    t.string   "project_id"
    t.integer  "task_id"
    t.string   "title"
    t.text     "content"
    t.integer  "responsible_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["project_id"], name: "index_manager_activities_on_project_id", using: :btree
    t.index ["task_id"], name: "index_manager_activities_on_task_id", using: :btree
  end

  create_table "manager_project_categories", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.boolean  "status",      default: false
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  create_table "manager_projects", force: :cascade do |t|
    t.integer  "project_category_id"
    t.string   "name"
    t.text     "description"
    t.integer  "situation",             default: 0
    t.integer  "responsible_id"
    t.integer  "responsible_sector_id"
    t.integer  "requester_id"
    t.integer  "requester_sector_id"
    t.integer  "manager_id"
    t.string   "assessment"
    t.integer  "priority",              default: 0
    t.date     "start"
    t.date     "end"
    t.integer  "tasks_count",           default: 0
    t.integer  "closed_tasks_count",    default: 0
    t.integer  "template_id"
    t.boolean  "template_generated",    default: false
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
  end

  create_table "manager_sub_tasks", force: :cascade do |t|
    t.integer  "task_id"
    t.string   "name"
    t.date     "due"
    t.boolean  "solved",     default: false
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "manager_task_attachments", force: :cascade do |t|
    t.integer  "task_id"
    t.string   "name"
    t.text     "description"
    t.string   "document"
    t.integer  "responsible_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["task_id"], name: "index_manager_task_attachments_on_task_id", using: :btree
  end

  create_table "manager_task_comments", force: :cascade do |t|
    t.integer  "task_id"
    t.text     "content"
    t.integer  "commenter_id"
    t.boolean  "thumbs_up",       default: false
    t.integer  "thumbs_up_id"
    t.boolean  "project_comment", default: false
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.index ["task_id"], name: "index_manager_task_comments_on_task_id", using: :btree
  end

  create_table "manager_task_problems", force: :cascade do |t|
    t.integer  "task_id"
    t.text     "description"
    t.datetime "recognition_date"
    t.boolean  "solved",                default: false
    t.text     "resolution"
    t.integer  "responsible_id"
    t.integer  "responsible_sector_id"
    t.string   "document"
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
  end

  create_table "manager_tasks", force: :cascade do |t|
    t.integer  "project_id"
    t.string   "title"
    t.text     "description"
    t.date     "due"
    t.date     "original_due"
    t.integer  "situation",        default: 0
    t.integer  "due_days"
    t.text     "resolution"
    t.integer  "responsible_id"
    t.integer  "sector_id"
    t.integer  "priority",         default: 0
    t.integer  "task_required_id"
    t.date     "solved_date"
    t.integer  "order"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.index ["project_id"], name: "index_manager_tasks_on_project_id", using: :btree
  end

  create_table "manager_template_tasks", force: :cascade do |t|
    t.integer  "template_id"
    t.string   "title"
    t.text     "description"
    t.integer  "due_days",         default: 1
    t.string   "goal"
    t.integer  "sector_id"
    t.integer  "responsible_id"
    t.boolean  "requester",        default: false
    t.integer  "priority",         default: 0
    t.integer  "order",            default: 0
    t.integer  "task_required_id"
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
  end

  create_table "manager_templates", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "sector_id"
    t.boolean  "status",      default: true
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "mobilization_events", force: :cascade do |t|
    t.string   "name"
    t.date     "date"
    t.text     "description"
    t.integer  "situation"
    t.string   "photo"
    t.boolean  "status"
    t.string   "district"
    t.integer  "city_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.text     "content"
    t.index ["city_id"], name: "index_mobilization_events_on_city_id", using: :btree
  end

  create_table "mobilization_sliders", force: :cascade do |t|
    t.string   "title"
    t.string   "photo"
    t.boolean  "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "patrimony_conservations", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.boolean  "status"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "patrimony_properties", force: :cascade do |t|
    t.string   "lent"
    t.string   "number"
    t.text     "description"
    t.integer  "property_subtype_id"
    t.integer  "staff_id"
    t.integer  "conservation_id"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.index ["conservation_id"], name: "index_patrimony_properties_on_conservation_id", using: :btree
    t.index ["property_subtype_id"], name: "index_patrimony_properties_on_property_subtype_id", using: :btree
    t.index ["staff_id"], name: "index_patrimony_properties_on_staff_id", using: :btree
  end

  create_table "patrimony_property_locations", force: :cascade do |t|
    t.integer  "property_id"
    t.integer  "responsible_id"
    t.string   "responsible2"
    t.integer  "sector_id"
    t.boolean  "location"
    t.boolean  "responsible_on"
    t.text     "description"
    t.integer  "staff_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["property_id"], name: "index_patrimony_property_locations_on_property_id", using: :btree
    t.index ["responsible_id"], name: "index_patrimony_property_locations_on_responsible_id", using: :btree
    t.index ["sector_id"], name: "index_patrimony_property_locations_on_sector_id", using: :btree
    t.index ["staff_id"], name: "index_patrimony_property_locations_on_staff_id", using: :btree
  end

  create_table "patrimony_property_subtypes", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.boolean  "status"
    t.integer  "property_type_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.index ["property_type_id"], name: "index_patrimony_property_subtypes_on_property_type_id", using: :btree
  end

  create_table "patrimony_property_types", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.boolean  "status"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "person_allowance_dates", force: :cascade do |t|
    t.date     "init_date"
    t.date     "final_date"
    t.boolean  "consecutive"
    t.integer  "allowance_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["allowance_id"], name: "index_person_allowance_dates_on_allowance_id", using: :btree
  end

  create_table "person_allowances", force: :cascade do |t|
    t.date     "allowance_date"
    t.text     "observation"
    t.integer  "employee_id"
    t.boolean  "status"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.integer  "assignment"
    t.index ["employee_id"], name: "index_person_allowances_on_employee_id", using: :btree
  end

  create_table "person_branch_line_staffs", force: :cascade do |t|
    t.integer  "branch_line_id"
    t.integer  "staff_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["branch_line_id"], name: "index_person_branch_line_staffs_on_branch_line_id", using: :btree
    t.index ["staff_id"], name: "index_person_branch_line_staffs_on_staff_id", using: :btree
  end

  create_table "person_branch_lines", force: :cascade do |t|
    t.string   "telephone"
    t.string   "description"
    t.boolean  "status"
    t.integer  "sector_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["sector_id"], name: "index_person_branch_lines_on_sector_id", using: :btree
  end

  create_table "person_contract_statuses", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.boolean  "status"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "person_education_backgrounds", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.boolean  "status"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "person_holidays", force: :cascade do |t|
    t.integer  "month"
    t.integer  "year"
    t.string   "days"
    t.text     "observation"
    t.integer  "staff_id"
    t.boolean  "status"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["staff_id"], name: "index_person_holidays_on_staff_id", using: :btree
  end

  create_table "person_jobs", force: :cascade do |t|
    t.string   "name"
    t.string   "code"
    t.boolean  "status"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.string   "salary"
    t.string   "function_code"
  end

  create_table "person_notifications", force: :cascade do |t|
    t.integer  "staff_id"
    t.integer  "reference_id"
    t.integer  "reference_model"
    t.string   "reference_context"
    t.string   "title"
    t.text     "content"
    t.boolean  "read",              default: false
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
  end

  create_table "person_sector_interlocutors", force: :cascade do |t|
    t.integer "staff_id"
    t.integer "sector_id"
    t.boolean "status"
    t.index ["sector_id"], name: "index_person_sector_interlocutors_on_sector_id", using: :btree
    t.index ["staff_id"], name: "index_person_sector_interlocutors_on_staff_id", using: :btree
  end

  create_table "person_sectors", force: :cascade do |t|
    t.string   "name"
    t.string   "acron"
    t.string   "prefex"
    t.integer  "father_id"
    t.integer  "responsible_id"
    t.boolean  "status"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.string   "code"
    t.string   "color"
    t.string   "childs",         default: [],              array: true
    t.index ["father_id"], name: "index_person_sectors_on_father_id", using: :btree
    t.index ["responsible_id"], name: "index_person_sectors_on_responsible_id", using: :btree
  end

  create_table "person_staff_mirrors", force: :cascade do |t|
    t.string   "name"
    t.string   "cpf"
    t.string   "rg"
    t.string   "rg_org"
    t.string   "blood_type"
    t.date     "born"
    t.string   "email",                   default: "", null: false
    t.integer  "gender",                  default: 0
    t.string   "private_email"
    t.string   "string"
    t.integer  "civil_state_id"
    t.string   "birth_place"
    t.string   "uf_born"
    t.integer  "contract_status_id"
    t.string   "address"
    t.string   "complement_address"
    t.string   "burgh"
    t.integer  "city_id"
    t.string   "cep"
    t.string   "telephone"
    t.string   "celphone"
    t.string   "number_ctps"
    t.string   "serie_ctps"
    t.string   "uf_ctps"
    t.string   "pis_pasep_number"
    t.date     "pis_pasep_date"
    t.string   "electoral_title_number"
    t.string   "electoral_title_zone"
    t.string   "electoral_title_section"
    t.string   "electoral_title_city"
    t.string   "electoral_title_uf"
    t.string   "bank_number"
    t.string   "account_number"
    t.string   "agency_number"
    t.integer  "staff_id"
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
    t.string   "spouse_name"
    t.integer  "education_background_id"
    t.string   "graduation"
    t.index ["city_id"], name: "index_person_staff_mirrors_on_city_id", using: :btree
    t.index ["civil_state_id"], name: "index_person_staff_mirrors_on_civil_state_id", using: :btree
    t.index ["contract_status_id"], name: "index_person_staff_mirrors_on_contract_status_id", using: :btree
    t.index ["staff_id"], name: "index_person_staff_mirrors_on_staff_id", using: :btree
  end

  create_table "person_staff_permissions", force: :cascade do |t|
    t.integer  "system_id"
    t.integer  "system_permission_id"
    t.integer  "system_module_id"
    t.integer  "staff_id"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.index ["staff_id"], name: "index_person_staff_permissions_on_staff_id", using: :btree
    t.index ["system_id"], name: "index_person_staff_permissions_on_system_id", using: :btree
    t.index ["system_module_id"], name: "index_person_staff_permissions_on_system_module_id", using: :btree
    t.index ["system_permission_id"], name: "index_person_staff_permissions_on_system_permission_id", using: :btree
  end

  create_table "person_staffs", force: :cascade do |t|
    t.string   "code"
    t.string   "name"
    t.string   "cpf"
    t.string   "rg"
    t.string   "rg_org"
    t.string   "blood_type"
    t.date     "born"
    t.string   "avatar"
    t.string   "personal_image"
    t.text     "branch_line_id",          default: [],                 array: true
    t.string   "curriculum"
    t.string   "email",                   default: "",    null: false
    t.string   "start_hour"
    t.string   "end_hour"
    t.date     "date_contract"
    t.date     "date_shutdown"
    t.boolean  "wekeend",                 default: false
    t.boolean  "status",                  default: true
    t.boolean  "administrator",           default: false
    t.integer  "gender",                  default: 0
    t.date     "last_signed_in_at"
    t.string   "password"
    t.string   "token"
    t.boolean  "token_status",            default: true
    t.date     "password_change"
    t.integer  "job_id"
    t.integer  "sector_origin_id"
    t.integer  "sector_current_id"
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
    t.integer  "access_count",            default: 0
    t.boolean  "terms_user",              default: false
    t.string   "introduce"
    t.string   "private_email"
    t.integer  "civil_state_id"
    t.string   "birth_place"
    t.string   "uf_born"
    t.integer  "contract_status_id"
    t.string   "address"
    t.string   "complement_address"
    t.string   "burgh"
    t.integer  "city_id"
    t.string   "cep"
    t.string   "telephone"
    t.string   "celphone"
    t.string   "number_ctps"
    t.string   "serie_ctps"
    t.string   "uf_ctps"
    t.string   "pis_pasep_number"
    t.date     "pis_pasep_date"
    t.string   "electoral_title_number"
    t.string   "electoral_title_zone"
    t.string   "electoral_title_section"
    t.string   "electoral_title_city"
    t.string   "electoral_title_uf"
    t.string   "bank_number"
    t.string   "account_number"
    t.string   "agency_number"
    t.string   "spouse_name"
    t.integer  "education_background_id"
    t.string   "graduation"
    t.text     "mobile_user_token"
    t.text     "mobile_push_token"
    t.string   "resolution"
    t.date     "resolution_date"
    t.string   "pin"
    t.string   "signature"
    t.string   "rubric"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.index ["code"], name: "index_person_staffs_on_code", unique: true, using: :btree
    t.index ["job_id"], name: "index_person_staffs_on_job_id", using: :btree
    t.index ["sector_current_id"], name: "index_person_staffs_on_sector_current_id", using: :btree
    t.index ["sector_origin_id"], name: "index_person_staffs_on_sector_origin_id", using: :btree
  end

  create_table "person_system_modules", force: :cascade do |t|
    t.string   "title"
    t.string   "code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "person_system_permissions", force: :cascade do |t|
    t.string   "action"
    t.integer  "code"
    t.boolean  "status"
    t.integer  "system_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["system_id"], name: "index_person_system_permissions_on_system_id", using: :btree
  end

  create_table "person_systems", force: :cascade do |t|
    t.string   "name"
    t.string   "code"
    t.boolean  "status"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.integer  "system_module_id"
    t.index ["system_module_id"], name: "index_person_systems_on_system_module_id", using: :btree
  end

  create_table "person_time_sheets", force: :cascade do |t|
    t.integer  "month"
    t.integer  "year"
    t.integer  "employee_id"
    t.integer  "holiday_id"
    t.string   "exception_days"
    t.string   "exception_days_text"
    t.string   "exception_before_noon"
    t.string   "exception_afternoon"
    t.string   "exception_before_noon_text"
    t.string   "exception_afternoon_text"
    t.integer  "staff_id"
    t.integer  "vocation_id"
    t.boolean  "status"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.index ["employee_id"], name: "index_person_time_sheets_on_employee_id", using: :btree
    t.index ["holiday_id"], name: "index_person_time_sheets_on_holiday_id", using: :btree
    t.index ["staff_id"], name: "index_person_time_sheets_on_staff_id", using: :btree
    t.index ["vocation_id"], name: "index_person_time_sheets_on_vocation_id", using: :btree
  end

  create_table "person_timetables", force: :cascade do |t|
    t.time     "horary"
    t.integer  "period"
    t.string   "ip"
    t.date     "timetable_date"
    t.integer  "staff_id"
    t.integer  "liberation_staff_id"
    t.text     "liberation_observation"
    t.datetime "liberation_date"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.index ["liberation_staff_id"], name: "index_person_timetables_on_liberation_staff_id", using: :btree
    t.index ["staff_id"], name: "index_person_timetables_on_staff_id", using: :btree
  end

  create_table "person_vocations", force: :cascade do |t|
    t.date     "start_date"
    t.date     "end_date"
    t.integer  "period"
    t.integer  "assignment"
    t.integer  "staff_id"
    t.boolean  "status"
    t.boolean  "authorized"
    t.boolean  "advance_money"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.boolean  "updated"
    t.boolean  "paid_bonus"
    t.boolean  "financial_allowance"
    t.index ["staff_id"], name: "index_person_vocations_on_staff_id", using: :btree
  end

  create_table "project_companies", force: :cascade do |t|
    t.string   "name"
    t.string   "trade"
    t.string   "cnpj"
    t.string   "email"
    t.integer  "city_id"
    t.string   "address"
    t.string   "adjunct_address"
    t.string   "cep"
    t.string   "telephone"
    t.string   "telephone_optional"
    t.boolean  "status",             default: true
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.string   "token"
    t.datetime "token_expires_in"
    t.index ["city_id"], name: "index_project_companies_on_city_id", using: :btree
  end

  create_table "project_enterprise_typologies", force: :cascade do |t|
    t.integer  "enterprise_id"
    t.integer  "typology_id"
    t.integer  "units"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.string   "description"
    t.string   "name"
    t.string   "home_type"
    t.string   "private_area"
    t.string   "income_family"
    t.string   "initial_value"
    t.string   "end_value"
    t.string   "value"
    t.boolean  "status"
    t.index ["enterprise_id"], name: "index_project_enterprise_typologies_on_enterprise_id", using: :btree
    t.index ["typology_id"], name: "index_project_enterprise_typologies_on_typology_id", using: :btree
  end

  create_table "project_enterprises", force: :cascade do |t|
    t.string   "name"
    t.string   "value"
    t.integer  "typology_id"
    t.integer  "company_id"
    t.boolean  "status",                  default: true
    t.string   "edict_number"
    t.string   "process_number"
    t.integer  "situation"
    t.string   "units"
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
    t.integer  "old_id"
    t.boolean  "manifestation_enabled",   default: false
    t.string   "reference_link"
    t.integer  "entity_id"
    t.boolean  "entity_payment_required", default: false
    t.string   "image"
    t.index ["company_id"], name: "index_project_enterprises_on_company_id", using: :btree
    t.index ["typology_id"], name: "index_project_enterprises_on_typology_id", using: :btree
  end

  create_table "project_steps", force: :cascade do |t|
    t.integer  "enterprise_id"
    t.string   "name"
    t.text     "text"
    t.integer  "demand",        default: 0
    t.string   "rii",           default: "40"
    t.string   "rie",           default: "40"
    t.string   "old",           default: "8"
    t.string   "special",       default: "7"
    t.string   "vulnerable",    default: "5"
    t.integer  "situation",     default: 0
    t.boolean  "status",        default: true
    t.integer  "creator_id"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.index ["creator_id"], name: "index_project_steps_on_creator_id", using: :btree
    t.index ["enterprise_id"], name: "index_project_steps_on_enterprise_id", using: :btree
  end

  create_table "project_typologies", force: :cascade do |t|
    t.string   "name"
    t.string   "home_type"
    t.string   "private_area"
    t.string   "income_family"
    t.string   "initial_value"
    t.string   "end_value"
    t.boolean  "status",        default: true
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  create_table "project_user_companies", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "login_user"
    t.string   "password"
    t.boolean  "admin"
    t.integer  "company_id"
    t.boolean  "status",     default: true
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.index ["company_id"], name: "index_project_user_companies_on_company_id", using: :btree
  end

  create_table "protocol_allotments", force: :cascade do |t|
    t.text     "description"
    t.integer  "priority"
    t.date     "replay_date"
    t.integer  "amount_docs"
    t.boolean  "status",      default: false
    t.integer  "sector_id"
    t.integer  "staff_id"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.index ["sector_id"], name: "index_protocol_allotments_on_sector_id", using: :btree
    t.index ["staff_id"], name: "index_protocol_allotments_on_staff_id", using: :btree
  end

  create_table "protocol_assessment_situations", force: :cascade do |t|
    t.integer  "situation_id"
    t.text     "observation"
    t.integer  "staff_id"
    t.integer  "assessment_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["assessment_id"], name: "index_protocol_assessment_situations_on_assessment_id", using: :btree
    t.index ["staff_id"], name: "index_protocol_assessment_situations_on_staff_id", using: :btree
  end

  create_table "protocol_assessments", force: :cascade do |t|
    t.integer  "number"
    t.integer  "year"
    t.integer  "prefex"
    t.string   "document_number"
    t.string   "external_number"
    t.string   "requesting_unit"
    t.string   "external_agency"
    t.string   "recipient"
    t.string   "address"
    t.string   "cpf"
    t.string   "cnpj"
    t.string   "sign_by"
    t.string   "city"
    t.text     "observation"
    t.text     "description_subject"
    t.integer  "id_old"
    t.integer  "document_type_id"
    t.integer  "subject_id"
    t.integer  "staff_id"
    t.integer  "sector_id"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.boolean  "finalized"
    t.datetime "finalized_date"
    t.boolean  "responded"
    t.datetime "responded_date"
    t.integer  "responded_staff_id"
    t.boolean  "external_petition"
    t.string   "email"
    t.string   "telephone"
    t.string   "celphone"
    t.index ["document_type_id"], name: "index_protocol_assessments_on_document_type_id", using: :btree
    t.index ["sector_id"], name: "index_protocol_assessments_on_sector_id", using: :btree
    t.index ["staff_id"], name: "index_protocol_assessments_on_staff_id", using: :btree
    t.index ["subject_id"], name: "index_protocol_assessments_on_subject_id", using: :btree
  end

  create_table "protocol_attach_documents", force: :cascade do |t|
    t.integer  "document_father_id"
    t.integer  "document_child_id"
    t.integer  "attach_type"
    t.integer  "sector_id"
    t.integer  "staff_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.text     "observation"
    t.index ["document_child_id"], name: "index_protocol_attach_documents_on_document_child_id", using: :btree
    t.index ["document_father_id"], name: "index_protocol_attach_documents_on_document_father_id", using: :btree
    t.index ["sector_id"], name: "index_protocol_attach_documents_on_sector_id", using: :btree
    t.index ["staff_id"], name: "index_protocol_attach_documents_on_staff_id", using: :btree
  end

  create_table "protocol_conducts", force: :cascade do |t|
    t.text     "description"
    t.integer  "conduct_type"
    t.integer  "assessment_id"
    t.integer  "staff_id"
    t.integer  "sector_id"
    t.integer  "allotment_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.date     "replay_date"
    t.boolean  "responded"
    t.date     "responded_date"
    t.index ["allotment_id"], name: "index_protocol_conducts_on_allotment_id", using: :btree
    t.index ["assessment_id"], name: "index_protocol_conducts_on_assessment_id", using: :btree
    t.index ["sector_id"], name: "index_protocol_conducts_on_sector_id", using: :btree
    t.index ["staff_id"], name: "index_protocol_conducts_on_staff_id", using: :btree
  end

  create_table "protocol_digital_documents", force: :cascade do |t|
    t.integer  "page_number"
    t.string   "doc_path"
    t.integer  "assessment_id"
    t.integer  "staff_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["assessment_id"], name: "index_protocol_digital_documents_on_assessment_id", using: :btree
    t.index ["staff_id"], name: "index_protocol_digital_documents_on_staff_id", using: :btree
  end

  create_table "protocol_document_types", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.boolean  "status"
    t.integer  "prefex"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "protocol_locations", force: :cascade do |t|
    t.string   "shelf"
    t.string   "pile"
    t.string   "box"
    t.text     "observation"
    t.string   "desk"
    t.string   "network_path"
    t.integer  "assessment_id"
    t.integer  "sector_id"
    t.integer  "staff_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["assessment_id"], name: "index_protocol_locations_on_assessment_id", using: :btree
    t.index ["sector_id"], name: "index_protocol_locations_on_sector_id", using: :btree
    t.index ["staff_id"], name: "index_protocol_locations_on_staff_id", using: :btree
  end

  create_table "protocol_subjects", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.boolean  "status"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "protocol_workflows", force: :cascade do |t|
    t.integer  "assessment_id"
    t.integer  "attachment_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "regularization_addresses", force: :cascade do |t|
    t.integer  "city_id"
    t.string   "address"
    t.integer  "type_id"
    t.boolean  "status",     default: true
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "regularization_document_attaches", force: :cascade do |t|
    t.string   "name"
    t.string   "attachment"
    t.integer  "staff_id"
    t.integer  "document_control_id"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  create_table "regularization_document_controls", force: :cascade do |t|
    t.string   "name"
    t.string   "cpf"
    t.string   "document_number"
    t.integer  "city_id"
    t.string   "address"
    t.string   "localization"
    t.integer  "document_type_id"
    t.integer  "office_id"
    t.string   "act_number"
    t.date     "document_date"
    t.integer  "situation_type_id"
    t.date     "move_date"
    t.date     "departure_date"
    t.integer  "staff_id"
    t.boolean  "status",            default: true
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
  end

  create_table "regularization_document_types", force: :cascade do |t|
    t.string   "name"
    t.boolean  "status",     default: true
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "regularization_documents", force: :cascade do |t|
    t.string   "name"
    t.string   "link"
    t.integer  "type_id"
    t.boolean  "status",     default: true
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "regularization_enabled_transfers", force: :cascade do |t|
    t.integer  "cadastre_id"
    t.integer  "staff_id"
    t.text     "observation"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["cadastre_id"], name: "index_regularization_enabled_transfers_on_cadastre_id", using: :btree
    t.index ["staff_id"], name: "index_regularization_enabled_transfers_on_staff_id", using: :btree
  end

  create_table "regularization_observation_controls", force: :cascade do |t|
    t.integer  "document_control_id"
    t.text     "observation"
    t.integer  "staff_id"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  create_table "regularization_offices", force: :cascade do |t|
    t.string   "name"
    t.string   "address"
    t.integer  "city_id"
    t.boolean  "status",     default: true
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "regularization_requeriment_olds", force: :cascade do |t|
    t.string   "name"
    t.string   "cpf"
    t.string   "nationality"
    t.string   "civil_state"
    t.string   "job"
    t.string   "telephone"
    t.string   "telephone_optional"
    t.string   "email"
    t.string   "city"
    t.string   "address"
    t.string   "complement_address"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  create_table "regularization_requeriments", force: :cascade do |t|
    t.string   "name"
    t.string   "cpf"
    t.string   "rg"
    t.string   "email"
    t.string   "nationality"
    t.integer  "marital_status"
    t.integer  "gender"
    t.date     "born"
    t.string   "telephone"
    t.string   "celphone"
    t.string   "complete_address"
    t.float    "income"
    t.string   "spouse_name"
    t.string   "spouse_cpf"
    t.boolean  "owner",            default: false
    t.boolean  "status",           default: false
    t.integer  "convocation_id"
    t.integer  "unit_id"
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.index ["convocation_id"], name: "index_regularization_requeriments_on_convocation_id", using: :btree
    t.index ["unit_id"], name: "index_regularization_requeriments_on_unit_id", using: :btree
  end

  create_table "regularization_situation_types", force: :cascade do |t|
    t.string   "name"
    t.boolean  "status",     default: true
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "regularization_solicitation_answers", force: :cascade do |t|
    t.text     "answer"
    t.integer  "staff_id"
    t.integer  "solicitation_id"
    t.boolean  "status"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "request_id"
  end

  create_table "regularization_solicitation_documents", force: :cascade do |t|
    t.string   "attachment"
    t.integer  "solicitation_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "request_id"
  end

  create_table "regularization_solicitation_requests", force: :cascade do |t|
    t.boolean  "status"
    t.text     "observation"
    t.integer  "solicitation_id"
    t.integer  "staff_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "regularization_solicitation_subjects", force: :cascade do |t|
    t.string   "name"
    t.boolean  "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "regularization_solicitations", force: :cascade do |t|
    t.string   "name"
    t.string   "cpf"
    t.string   "email"
    t.integer  "subject_id"
    t.integer  "unit_id"
    t.integer  "city_id"
    t.string   "address"
    t.text     "content"
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.boolean  "answer_status", default: false
    t.string   "phone"
    t.string   "telephone"
    t.string   "celphone"
  end

  create_table "regularization_ticket_attendances", force: :cascade do |t|
    t.integer  "staff_id"
    t.integer  "attendance_type", default: 0
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  create_table "regularization_ticket_cadastres", force: :cascade do |t|
    t.integer  "ticket_id"
    t.integer  "cadastre_id"
    t.string   "name"
    t.string   "mother_name"
    t.string   "father_name"
    t.string   "cpf"
    t.string   "rg"
    t.string   "rg_uf"
    t.string   "nationatily"
    t.string   "job"
    t.integer  "civil_state_id"
    t.string   "regime"
    t.string   "regime_date"
    t.string   "spouse_name"
    t.string   "spouse_mother_name"
    t.string   "spouse_father_name"
    t.string   "spouse_cpf"
    t.string   "spouse_rg"
    t.string   "spouse_rg_uf"
    t.string   "spouse_nationatily"
    t.string   "spouse_job"
    t.integer  "spouse_civil_state_id"
    t.string   "spouse_regime"
    t.string   "spouse_regime_date"
    t.float    "income"
    t.string   "telephone"
    t.string   "telephone_optional"
    t.string   "celphone"
    t.string   "email"
    t.integer  "procedural_situation_id"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.string   "document_number"
  end

  create_table "regularization_ticket_document_types", force: :cascade do |t|
    t.string   "name"
    t.boolean  "required",   default: false
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "regularization_ticket_documents", force: :cascade do |t|
    t.integer  "ticket_id"
    t.integer  "document_type_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "regularization_ticket_procedural_situations", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "regularization_ticket_units", force: :cascade do |t|
    t.integer  "ticket_id"
    t.integer  "unit_id"
    t.string   "complete_address"
    t.integer  "city_id"
    t.string   "registration"
    t.string   "registration_iptu"
    t.float    "area"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  create_table "regularization_tickets", force: :cascade do |t|
    t.integer  "unit_id"
    t.string   "process_number"
    t.text     "dispatch"
    t.boolean  "attendant",               default: false
    t.integer  "attendant_id"
    t.datetime "attendant_date"
    t.text     "attendant_observation"
    t.boolean  "supervisor",              default: false
    t.integer  "supervisor_id"
    t.datetime "supervisor_date"
    t.text     "supervisor_observation"
    t.boolean  "manager",                 default: false
    t.integer  "manager_id"
    t.datetime "manager_date"
    t.text     "manager_observation"
    t.boolean  "director",                default: false
    t.integer  "director_id"
    t.datetime "director_date"
    t.text     "director_observation"
    t.integer  "cadastre_situation_id"
    t.integer  "cadastre_procedural_id"
    t.integer  "unit_situation_id"
    t.integer  "procedural_situation_id"
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
  end

  create_table "regularization_types", force: :cascade do |t|
    t.string   "name"
    t.boolean  "status",     default: true
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "schedule_agenda_schedules", force: :cascade do |t|
    t.integer  "agenda_id"
    t.date     "date"
    t.time     "hour"
    t.date     "born"
    t.string   "name"
    t.string   "cpf"
    t.string   "email"
    t.string   "telephone"
    t.string   "telephone_optional"
    t.string   "celphone"
    t.string   "observation"
    t.text     "attendant_observation"
    t.integer  "status",                default: 0
    t.integer  "city_id"
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.string   "cnpj"
    t.integer  "city_agenda_id"
    t.string   "address_agenda"
    t.string   "document_number"
    t.index ["agenda_id"], name: "index_schedule_agenda_schedules_on_agenda_id", using: :btree
    t.index ["city_id"], name: "index_schedule_agenda_schedules_on_city_id", using: :btree
  end

  create_table "schedule_agendas", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.string   "avatar"
    t.date     "start"
    t.date     "end"
    t.text     "disable_dates"
    t.time     "start_hour"
    t.time     "end_hour"
    t.integer  "attendance_time",  default: 15
    t.integer  "attendants"
    t.boolean  "weekend",          default: false
    t.boolean  "lunch_time",       default: false
    t.integer  "lunch_attendants"
    t.time     "lunch_start"
    t.time     "lunch_end"
    t.integer  "restriction_type", default: 0
    t.text     "restriction_sql"
    t.string   "location"
    t.integer  "program_id"
    t.integer  "staff_id"
    t.boolean  "status",           default: true
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.string   "local"
    t.index ["program_id"], name: "index_schedule_agendas_on_program_id", using: :btree
    t.index ["staff_id"], name: "index_schedule_agendas_on_staff_id", using: :btree
  end

  create_table "schedule_data_reference_uploads", force: :cascade do |t|
    t.string   "document"
    t.integer  "data_reference_id"
    t.integer  "staff_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  create_table "schedule_data_references", force: :cascade do |t|
    t.string   "name"
    t.string   "cpf"
    t.string   "observation"
    t.string   "code"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.integer  "city_agenda_id"
    t.string   "address_agenda"
    t.string   "document_number"
    t.string   "block"
    t.boolean  "updated"
    t.date     "updated_date"
    t.integer  "updated_staff_id"
    t.string   "lat"
    t.string   "lng"
    t.string   "assessment"
    t.string   "cep"
    t.index ["code"], name: "index_schedule_data_references_on_code", using: :btree
  end

  create_table "sefaz_allotments", force: :cascade do |t|
    t.integer  "staff_id"
    t.text     "error_message"
    t.datetime "send_date"
    t.integer  "send_staff_id"
    t.string   "protocol_return"
    t.integer  "exemption_type"
    t.string   "notifiers"
    t.string   "cnpj_notifiers"
    t.text     "observation"
    t.integer  "send_status_id"
    t.integer  "send_type"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["send_staff_id"], name: "index_sefaz_allotments_on_send_staff_id", using: :btree
    t.index ["send_status_id"], name: "index_sefaz_allotments_on_send_status_id", using: :btree
    t.index ["staff_id"], name: "index_sefaz_allotments_on_staff_id", using: :btree
  end

  create_table "sefaz_exemptions", force: :cascade do |t|
    t.string   "name"
    t.string   "cpf"
    t.string   "city"
    t.string   "address"
    t.string   "realty_number"
    t.string   "realty_value"
    t.integer  "allotment_id"
    t.string   "act_number"
    t.boolean  "canceled"
    t.datetime "canceled_date"
    t.integer  "canceled_staff_id"
    t.text     "return_message"
    t.integer  "staff_id"
    t.boolean  "unitary"
    t.string   "system_message"
    t.string   "number_act_to_cancel"
    t.integer  "year_act"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.index ["allotment_id"], name: "index_sefaz_exemptions_on_allotment_id", using: :btree
    t.index ["canceled_staff_id"], name: "index_sefaz_exemptions_on_canceled_staff_id", using: :btree
    t.index ["staff_id"], name: "index_sefaz_exemptions_on_staff_id", using: :btree
  end

  create_table "sefaz_send_statuses", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.boolean  "status"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "sei_codhab_sei_configs", force: :cascade do |t|
    t.integer  "legal_hypothesis_id"
    t.string   "legal_hypothesis"
    t.integer  "access"
    t.integer  "procedure_id"
    t.integer  "subject_id"
    t.string   "name"
    t.integer  "code"
    t.text     "description"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  create_table "sei_codhab_sei_procedures", force: :cascade do |t|
    t.string   "name"
    t.boolean  "status"
    t.integer  "sei_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sei_codhab_sei_subjects", force: :cascade do |t|
    t.string   "name"
    t.boolean  "status"
    t.integer  "sei_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "simple_captcha_data", force: :cascade do |t|
    t.string   "key",        limit: 40
    t.string   "value",      limit: 6
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "social_work_cadastre_cadastre_locations", force: :cascade do |t|
    t.integer  "cadastre_id"
    t.integer  "location_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "order"
    t.index ["cadastre_id"], name: "index_social_work_cadastre_cadastre_locations_on_cadastre_id", using: :btree
    t.index ["location_id"], name: "index_social_work_cadastre_cadastre_locations_on_location_id", using: :btree
  end

  create_table "social_work_cadastre_cadastre_members", force: :cascade do |t|
    t.string   "name"
    t.string   "formation"
    t.string   "rg"
    t.string   "cpf"
    t.string   "telephone"
    t.string   "celphone"
    t.string   "activite"
    t.string   "registration_crea"
    t.integer  "cadastre_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  create_table "social_work_cadastre_cadastre_steps", force: :cascade do |t|
    t.integer  "cadastre_id"
    t.integer  "step"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["cadastre_id"], name: "index_social_work_cadastre_cadastre_steps_on_cadastre_id", using: :btree
  end

  create_table "social_work_cadastre_cadastre_titulars", force: :cascade do |t|
    t.string   "name"
    t.string   "formation"
    t.string   "rg"
    t.string   "cpf"
    t.integer  "cadastre_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "social_work_cadastre_cadastres", force: :cascade do |t|
    t.string   "social_reason"
    t.string   "crea"
    t.string   "cnpj"
    t.string   "password"
    t.string   "address"
    t.string   "cep"
    t.string   "uf"
    t.string   "telephone"
    t.string   "celphone"
    t.string   "email"
    t.integer  "city_id"
    t.string   "district"
    t.boolean  "technological_resources"
    t.boolean  "declaration_1"
    t.boolean  "declaration_2"
    t.boolean  "declaration_3"
    t.boolean  "declaration_4"
    t.boolean  "sicaf"
    t.integer  "situation"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.string   "reset_digest"
    t.datetime "reset_sent_at"
    t.string   "activation_digest"
    t.boolean  "activated"
    t.datetime "activated_at"
    t.integer  "order"
    t.boolean  "confirm"
  end

  create_table "social_work_cadastre_document_types", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.boolean  "status"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.boolean  "sicaf"
    t.integer  "order"
  end

  create_table "social_work_cadastre_location_selects", force: :cascade do |t|
    t.integer  "location_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "social_work_cadastre_locations", force: :cascade do |t|
    t.integer  "city_id"
    t.string   "name"
    t.boolean  "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "social_work_cadastre_observations", force: :cascade do |t|
    t.integer  "cadastre_id"
    t.text     "observation"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.boolean  "status"
    t.boolean  "active"
  end

  create_table "social_work_cadastre_responsibles", force: :cascade do |t|
    t.integer  "members_id"
    t.integer  "cadastre_id"
    t.boolean  "responsible"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "social_work_cadastre_upload_documents", force: :cascade do |t|
    t.integer  "document_type_id"
    t.integer  "cadastre_id"
    t.text     "observation"
    t.string   "file_path"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.boolean  "status",           default: true
  end

  create_table "social_work_questions", force: :cascade do |t|
    t.string   "name"
    t.boolean  "required"
    t.boolean  "status"
    t.integer  "question_type"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "social_work_social_category_totals", force: :cascade do |t|
    t.integer  "category_id"
    t.integer  "execution_id"
    t.integer  "control_project_id"
    t.decimal  "value"
    t.decimal  "metreage"
    t.integer  "staff_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.index ["category_id"], name: "index_social_work_social_category_totals_on_category_id", using: :btree
    t.index ["control_project_id"], name: "index_social_work_social_category_totals_on_control_project_id", using: :btree
    t.index ["execution_id"], name: "index_social_work_social_category_totals_on_execution_id", using: :btree
    t.index ["staff_id"], name: "index_social_work_social_category_totals_on_staff_id", using: :btree
  end

  create_table "social_work_social_contracts", force: :cascade do |t|
    t.integer  "company_id"
    t.string   "number"
    t.decimal  "value"
    t.integer  "station_id"
    t.integer  "staff_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_social_work_social_contracts_on_company_id", using: :btree
    t.index ["staff_id"], name: "index_social_work_social_contracts_on_staff_id", using: :btree
    t.index ["station_id"], name: "index_social_work_social_contracts_on_station_id", using: :btree
  end

  create_table "social_work_social_control_projects", force: :cascade do |t|
    t.text     "description"
    t.integer  "contract_id"
    t.integer  "staff_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["contract_id"], name: "index_social_work_social_control_projects_on_contract_id", using: :btree
    t.index ["staff_id"], name: "index_social_work_social_control_projects_on_staff_id", using: :btree
  end

  create_table "social_work_social_executions", force: :cascade do |t|
    t.integer  "control_project_id"
    t.decimal  "metreage"
    t.decimal  "value"
    t.date     "date"
    t.decimal  "social_value"
    t.decimal  "support_value"
    t.integer  "staff_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.index ["control_project_id"], name: "index_social_work_social_executions_on_control_project_id", using: :btree
    t.index ["staff_id"], name: "index_social_work_social_executions_on_staff_id", using: :btree
  end

  create_table "social_work_social_payments", force: :cascade do |t|
    t.date     "date"
    t.string   "code"
    t.date     "code_emission"
    t.decimal  "value"
    t.integer  "contract_id"
    t.integer  "staff_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["contract_id"], name: "index_social_work_social_payments_on_contract_id", using: :btree
    t.index ["staff_id"], name: "index_social_work_social_payments_on_staff_id", using: :btree
  end

  create_table "social_work_social_project_categories", force: :cascade do |t|
    t.string   "name"
    t.boolean  "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "social_work_social_project_goals", force: :cascade do |t|
    t.integer  "category_id"
    t.decimal  "metreage_goal"
    t.integer  "control_project_id"
    t.integer  "staff_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.index ["category_id"], name: "index_social_work_social_project_goals_on_category_id", using: :btree
    t.index ["control_project_id"], name: "index_social_work_social_project_goals_on_control_project_id", using: :btree
    t.index ["staff_id"], name: "index_social_work_social_project_goals_on_staff_id", using: :btree
  end

  create_table "stock_discards", force: :cascade do |t|
    t.text     "pages",       default: [],              array: true
    t.integer  "staff_id"
    t.text     "description"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "stock_numerators", force: :cascade do |t|
    t.integer  "start_page"
    t.integer  "end_page"
    t.string   "number_hash"
    t.integer  "staff_id"
    t.boolean  "status",           default: true
    t.string   "discard"
    t.integer  "staff_discard_id"
    t.boolean  "printed",          default: false
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
  end

  create_table "stock_outputs", force: :cascade do |t|
    t.string   "document_number"
    t.integer  "amount"
    t.integer  "requester_id"
    t.integer  "response_id"
    t.integer  "start_page"
    t.integer  "end_page"
    t.integer  "sector_id"
    t.text     "description"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "stock_paper_stores", force: :cascade do |t|
    t.string   "description"
    t.integer  "amount"
    t.integer  "staff_id"
    t.integer  "start_page"
    t.integer  "end_page"
    t.integer  "sector_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "technical_assistance_categories", force: :cascade do |t|
    t.string   "name"
    t.boolean  "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "technical_assistance_members", force: :cascade do |t|
    t.integer  "category_id"
    t.integer  "type_member_id"
    t.integer  "staff_id"
    t.integer  "station_id"
    t.string   "crea"
    t.string   "date_service"
    t.boolean  "status"
    t.boolean  "formation"
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
    t.string   "previous_coordination"
    t.boolean  "server_off",            default: false
  end

  create_table "technical_assistance_pre_registers", force: :cascade do |t|
    t.string   "name"
    t.string   "cpf"
    t.string   "address"
    t.string   "cad"
    t.integer  "city_id"
    t.string   "latitude"
    t.string   "longitude"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "technical_assistance_responsibles", force: :cascade do |t|
    t.string   "name"
    t.string   "contact"
    t.string   "contact2"
    t.string   "email"
    t.boolean  "status"
    t.text     "observation"
    t.integer  "station_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "staff_id"
    t.index ["station_id"], name: "index_technical_assistance_responsibles_on_station_id", using: :btree
  end

  create_table "technical_assistance_station_types", force: :cascade do |t|
    t.string   "name"
    t.text     "observation"
    t.boolean  "status"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "technical_assistance_stations", force: :cascade do |t|
    t.string   "name"
    t.string   "address"
    t.integer  "city_id"
    t.string   "schedule"
    t.string   "latitude"
    t.string   "longitude"
    t.boolean  "status"
    t.text     "observation"
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
    t.boolean  "status_cel"
    t.boolean  "technical"
    t.integer  "station_type_id"
    t.boolean  "status_extranet"
    t.integer  "service_station_id"
    t.string   "date_open"
    t.boolean  "monitor",            default: false
    t.index ["city_id"], name: "index_technical_assistance_stations_on_city_id", using: :btree
  end

  create_table "technical_assistance_type_members", force: :cascade do |t|
    t.string   "name"
    t.boolean  "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "vehicle_request_number_vouchers", force: :cascade do |t|
    t.integer  "voucher_number"
    t.integer  "request_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.string   "value"
    t.index ["request_id"], name: "index_vehicle_request_number_vouchers_on_request_id", using: :btree
  end

  create_table "vehicle_request_requests", force: :cascade do |t|
    t.integer  "sector_id"
    t.integer  "staff_id"
    t.date     "date"
    t.text     "destiny"
    t.text     "objective"
    t.integer  "situation"
    t.boolean  "status"
    t.integer  "requester_id"
    t.date     "authorized"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["requester_id"], name: "index_vehicle_request_requests_on_requester_id", using: :btree
    t.index ["sector_id"], name: "index_vehicle_request_requests_on_sector_id", using: :btree
    t.index ["staff_id"], name: "index_vehicle_request_requests_on_staff_id", using: :btree
  end

  create_table "warns", force: :cascade do |t|
    t.text     "severity"
    t.datetime "timestamps"
    t.text     "progname"
    t.text     "message"
    t.boolean  "solved",     default: false
    t.string   "target"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "wiki_bi_reports", force: :cascade do |t|
    t.string   "name"
    t.string   "report"
    t.boolean  "status"
    t.text     "content"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.boolean  "external"
    t.boolean  "internal"
    t.boolean  "header",     default: true
  end

  create_table "wiki_event_activities", force: :cascade do |t|
    t.integer  "event_id"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "wiki_events", force: :cascade do |t|
    t.integer  "staff_id"
    t.integer  "sector_id"
    t.integer  "responsible_id"
    t.date     "date"
    t.time     "hour"
    t.string   "name"
    t.text     "description"
    t.string   "image_path"
    t.integer  "city_id"
    t.string   "lng"
    t.string   "lat"
    t.integer  "privilege",      default: 0
    t.boolean  "portal",         default: false
    t.boolean  "publish",        default: true
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.integer  "situation",      default: 0
    t.index ["city_id"], name: "index_wiki_events_on_city_id", using: :btree
    t.index ["responsible_id"], name: "index_wiki_events_on_responsible_id", using: :btree
    t.index ["sector_id"], name: "index_wiki_events_on_sector_id", using: :btree
    t.index ["staff_id"], name: "index_wiki_events_on_staff_id", using: :btree
  end

  create_table "wiki_files", force: :cascade do |t|
    t.integer  "staff_id"
    t.integer  "sector_id"
    t.string   "original_name"
    t.string   "description"
    t.string   "hash_name"
    t.string   "file_path"
    t.boolean  "deleted",          default: false
    t.integer  "staff_deleted_id"
    t.datetime "deleted_at"
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.index ["deleted_at"], name: "index_wiki_files_on_deleted_at", using: :btree
    t.index ["file_path"], name: "index_wiki_files_on_file_path", unique: true, using: :btree
    t.index ["hash_name"], name: "index_wiki_files_on_hash_name", unique: true, using: :btree
    t.index ["sector_id"], name: "index_wiki_files_on_sector_id", using: :btree
    t.index ["staff_deleted_id"], name: "index_wiki_files_on_staff_deleted_id", using: :btree
    t.index ["staff_id"], name: "index_wiki_files_on_staff_id", using: :btree
  end

  create_table "wiki_images", force: :cascade do |t|
    t.integer  "staff_id"
    t.integer  "sector_id"
    t.string   "original_name"
    t.string   "description"
    t.string   "hash_name"
    t.string   "file_path"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["file_path"], name: "index_wiki_images_on_file_path", unique: true, using: :btree
    t.index ["hash_name"], name: "index_wiki_images_on_hash_name", unique: true, using: :btree
    t.index ["sector_id"], name: "index_wiki_images_on_sector_id", using: :btree
    t.index ["staff_id"], name: "index_wiki_images_on_staff_id", using: :btree
  end

  create_table "wiki_opnions", force: :cascade do |t|
    t.string   "option_one"
    t.string   "option_two"
    t.string   "option_three"
    t.string   "option_four"
    t.string   "option_five"
    t.integer  "staff_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "wiki_question_names", force: :cascade do |t|
    t.integer  "question"
    t.integer  "staff_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "wiki_question_ombudsmen", force: :cascade do |t|
    t.integer  "registrant_id"
    t.integer  "registration_id"
    t.integer  "sector_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["registrant_id"], name: "index_wiki_question_ombudsmen_on_registrant_id", using: :btree
    t.index ["registration_id"], name: "index_wiki_question_ombudsmen_on_registration_id", using: :btree
    t.index ["sector_id"], name: "index_wiki_question_ombudsmen_on_sector_id", using: :btree
  end

  create_table "wiki_reports", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.text     "query"
    t.string   "query_filter_one_name"
    t.text     "query_filter_one"
    t.string   "query_filter_two_name"
    t.text     "query_filter_two"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

end
