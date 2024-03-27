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

ActiveRecord::Schema.define(version: 9999906161509136743) do

  create_table "billings", force: :cascade do |t|
    t.float "cost"
    t.text "description"
    t.string "payment"
    t.integer "mycase_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "poster_id"
    t.string "poster_type"
    t.integer "status"
    t.index ["mycase_id"], name: "index_billings_on_mycase_id"
    t.index ["poster_type", "poster_id"], name: "index_billings_on_poster_type_and_poster_id"
  end

  create_table "comments", force: :cascade do |t|
    t.text "content"
    t.integer "post_id"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "slug"
    t.integer "commenter_id"
    t.string "commenter_type"
    t.index ["commenter_type", "commenter_id"], name: "index_comments_on_commenter_type_and_commenter_id"
    t.index ["slug"], name: "index_comments_on_slug", unique: true
  end

  create_table "delayed_jobs", force: :cascade do |t|
    t.integer "priority", default: 0, null: false
    t.integer "attempts", default: 0, null: false
    t.text "handler", null: false
    t.text "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string "locked_by"
    t.string "queue"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["priority", "run_at"], name: "delayed_jobs_priority"
  end

  create_table "friendly_id_slugs", force: :cascade do |t|
    t.string "slug", null: false
    t.integer "sluggable_id", null: false
    t.string "sluggable_type", limit: 50
    t.string "scope"
    t.datetime "created_at"
    t.index ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true
    t.index ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type"
    t.index ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id"
    t.index ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type"
  end

  create_table "lawfirms", force: :cascade do |t|
    t.string "name"
    t.string "type_of_organization"
    t.string "address"
    t.string "email"
    t.integer "phone_number", limit: 8
    t.string "state"
    t.string "city"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "logos"
    t.text "info"
    t.string "slug"
    t.integer "admin_id"
    t.integer "status"
    t.string "interval"
    t.index ["slug"], name: "index_lawfirms_on_slug", unique: true
  end

# Could not dump table "mycasecomments" because of following StandardError
#   Unknown type 'json' for column 'attachment'

  create_table "mycasepeople", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "mycases", force: :cascade do |t|
    t.string "caseNo"
    t.string "client_name"
    t.string "subject"
    t.string "area_of_practice"
    t.text "opponents"
    t.string "assigned_attorney"
    t.date "arrival_date"
    t.date "due_date"
    t.integer "status"
    t.text "summary_of_brief"
    t.string "add_judge"
    t.string "add_court"
    t.integer "admin_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "lawfirm_id"
    t.integer "client_id"
    t.float "cost"
    t.string "slug"
    t.string "entity"
    t.string "company_name"
    t.string "rc"
    t.string "rep_first"
    t.string "rep_last"
    t.string "f_name"
    t.string "l_name"
    t.string "company_spec"
    t.index ["admin_id"], name: "index_mycases_on_admin_id"
    t.index ["slug"], name: "index_mycases_on_slug", unique: true
  end

  create_table "mycases_users", id: false, force: :cascade do |t|
    t.integer "mycase_id", null: false
    t.integer "user_id", null: false
    t.index ["mycase_id", "user_id"], name: "index_mycases_users_on_mycase_id_and_user_id"
    t.index ["user_id", "mycase_id"], name: "index_mycases_users_on_user_id_and_mycase_id"
  end

  create_table "notifications", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "actor_id"
    t.string "notify_type", null: false
    t.string "target_type"
    t.integer "target_id"
    t.string "second_target_type"
    t.integer "second_target_id"
    t.string "third_target_type"
    t.integer "third_target_id"
    t.datetime "read_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id", "notify_type"], name: "index_notifications_on_user_id_and_notify_type"
    t.index ["user_id"], name: "index_notifications_on_user_id"
  end

  create_table "posts", force: :cascade do |t|
    t.string "title"
    t.text "body"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "slug"
    t.integer "poster_id"
    t.string "poster_type"
    t.string "file"
    t.index ["poster_type", "poster_id"], name: "index_posts_on_poster_type_and_poster_id"
    t.index ["slug"], name: "index_posts_on_slug", unique: true
  end

  create_table "roles", force: :cascade do |t|
    t.string "name"
    t.string "resource_type"
    t.integer "resource_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name", "resource_type", "resource_id"], name: "index_roles_on_name_and_resource_type_and_resource_id"
    t.index ["name"], name: "index_roles_on_name"
    t.index ["resource_type", "resource_id"], name: "index_roles_on_resource_type_and_resource_id"
  end

# Could not dump table "tasks" because of following StandardError
#   Unknown type 'json' for column 'document'

  create_table "transactions", force: :cascade do |t|
    t.integer "amount", limit: 8
    t.integer "integer", limit: 8
    t.integer "lawfirm_id"
    t.date "expires_on"
    t.string "channel"
    t.string "status"
    t.string "reference"
    t.string "gateway_response"
    t.string "customer_code"
    t.string "currency"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["lawfirm_id"], name: "index_transactions_on_lawfirm_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
    t.date "birthday"
    t.string "address"
    t.integer "phone_number", limit: 8
    t.string "state"
    t.string "city"
    t.integer "lawfirm_id"
    t.string "avatars"
    t.string "slug"
    t.string "type"
    t.string "position"
    t.string "entity"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["slug"], name: "index_users_on_slug", unique: true
  end

end
