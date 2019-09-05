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

ActiveRecord::Schema.define(version: 20190905173017) do

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
    t.index ["city_id"], name: "index_action_cadastres_on_city_id", using: :btree
    t.index ["formation_area_id"], name: "index_action_cadastres_on_formation_area_id", using: :btree
    t.index ["profession_id"], name: "index_action_cadastres_on_profession_id", using: :btree
    t.index ["state_id"], name: "index_action_cadastres_on_state_id", using: :btree
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
    t.index ["social_event_id"], name: "index_action_inscriptions_on_social_event_id", using: :btree
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

  create_table "entity_sliders", force: :cascade do |t|
    t.string   "title"
    t.string   "photo"
    t.boolean  "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
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

  create_table "main_type_events", force: :cascade do |t|
    t.string   "name"
    t.boolean  "status"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
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
    t.boolean  "crea_cau"
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
    t.boolean  "crea_cau"
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
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.string   "reset_digest"
    t.datetime "reset_sent_at"
    t.string   "activation_digest"
    t.boolean  "activated"
    t.datetime "activated_at"
    t.integer  "order"
    t.boolean  "confirm"
    t.integer  "assignment"
    t.boolean  "crea_cau",                default: true
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

end
