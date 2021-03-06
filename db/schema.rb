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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20121214015918) do

  create_table "ckeditor_assets", :force => true do |t|
    t.string   "data_file_name",                  :null => false
    t.string   "data_content_type"
    t.integer  "data_file_size"
    t.integer  "assetable_id"
    t.string   "assetable_type",    :limit => 30
    t.string   "type",              :limit => 30
    t.integer  "width"
    t.integer  "height"
    t.datetime "created_at",                      :null => false
    t.datetime "updated_at",                      :null => false
  end

  add_index "ckeditor_assets", ["assetable_type", "assetable_id"], :name => "idx_ckeditor_assetable"
  add_index "ckeditor_assets", ["assetable_type", "type", "assetable_id"], :name => "idx_ckeditor_assetable_type"

  create_table "collections", :force => true do |t|
    t.string   "name"
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "completions", :force => true do |t|
    t.integer  "lesson_id"
    t.integer  "course_id"
    t.integer  "user_id"
    t.integer  "status"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "completions", ["user_id", "course_id"], :name => "index_completions_on_user_id_and_course_id"
  add_index "completions", ["user_id", "lesson_id"], :name => "index_completions_on_user_id_and_lesson_id"

  create_table "courses", :force => true do |t|
    t.string   "title"
    t.text     "description"
    t.decimal  "price"
    t.float    "rating"
    t.boolean  "enabled"
    t.integer  "user_id"
    t.integer  "collection_id"
    t.integer  "language_id"
    t.integer  "no_of_reviews"
    t.integer  "no_of_registrations"
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
  end

  add_index "courses", ["collection_id"], :name => "index_courses_on_collection_id"
  add_index "courses", ["user_id"], :name => "index_courses_on_user_id"

  create_table "languages", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "lessons", :force => true do |t|
    t.string   "title"
    t.string   "description"
    t.integer  "course_id"
    t.integer  "sequence"
    t.datetime "created_at",            :null => false
    t.datetime "updated_at",            :null => false
    t.string   "material_file_name"
    t.string   "material_content_type"
    t.integer  "material_file_size"
    t.datetime "material_updated_at"
  end

  add_index "lessons", ["course_id"], :name => "index_lessons_on_course_id"

  create_table "lessons_materials", :force => true do |t|
    t.integer "lesson_id"
    t.integer "material_id"
  end

  create_table "materials", :force => true do |t|
    t.integer  "content_type"
    t.text     "detail_content"
    t.text     "embedded_content"
    t.string   "stored_file_name"
    t.string   "stored_content_type"
    t.integer  "stored_file_size"
    t.datetime "stored_updated_at"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
    t.integer  "user_id"
  end

  create_table "registrations", :force => true do |t|
    t.integer  "user_id"
    t.integer  "course_id"
    t.decimal  "price"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "registrations", ["user_id", "course_id"], :name => "index_registrations_on_user_id_and_course_id", :unique => true

  create_table "reviews", :force => true do |t|
    t.integer  "user_id"
    t.string   "comment"
    t.integer  "course_id"
    t.integer  "rating"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "reviews", ["course_id"], :name => "index_reviews_on_course_id"

  create_table "taggings", :force => true do |t|
    t.integer  "tag_id"
    t.integer  "taggable_id"
    t.string   "taggable_type"
    t.integer  "tagger_id"
    t.string   "tagger_type"
    t.string   "context",       :limit => 128
    t.datetime "created_at"
  end

  add_index "taggings", ["tag_id"], :name => "index_taggings_on_tag_id"
  add_index "taggings", ["taggable_id", "taggable_type", "context"], :name => "index_taggings_on_taggable_id_and_taggable_type_and_context"

  create_table "tags", :force => true do |t|
    t.string "name"
  end

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "username",               :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true
  add_index "users", ["username"], :name => "index_users_on_username", :unique => true

end
