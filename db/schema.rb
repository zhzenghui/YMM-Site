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

ActiveRecord::Schema.define(version: 20150907164821) do

  create_table "_online_details_old_20150820", force: true do |t|
    t.string   "media_url"
    t.text     "frames"
    t.text     "description"
    t.integer  "state"
    t.integer  "free"
    t.text     "priview"
    t.text     "auth"
    t.integer  "zan_count"
    t.integer  "share_count"
    t.integer  "online_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.text     "user"
    t.integer  "price"
    t.string   "zip_conver_url"
    t.string   "video_url"
    t.integer  "type"
    t.integer  "order"
    t.integer  "upyun_noti"
    t.string   "p_id",           default: ""
  end

  create_table "a_comments", force: true do |t|
    t.string   "content"
    t.integer  "status"
    t.integer  "album_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "a_comments", ["album_id"], name: "index_a_comments_on_album_id"

  create_table "albums", force: true do |t|
    t.string   "title"
    t.text     "text"
    t.integer  "publish"
    t.boolean  "free"
    t.integer  "user_id"
    t.string   "url"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
  end

  add_index "albums", ["user_id"], name: "index_albums_on_user_id"

  create_table "comments", force: true do |t|
    t.text     "content"
    t.integer  "user_id"
    t.integer  "zan_count"
    t.integer  "online_detail_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "comments", ["user_id"], name: "index_comments_on_user_id"

  create_table "flows", force: true do |t|
    t.string   "user_name"
    t.integer  "product_id"
    t.integer  "product_price"
    t.integer  "type",             default: 0
    t.integer  "iap_list_id"
    t.integer  "pay_status",       default: 0
    t.integer  "gathering_status", default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "iap_lists", force: true do |t|
    t.integer  "user_id",         default: 0
    t.string   "user_name",       default: ""
    t.integer  "type",            default: 0
    t.integer  "is_apple_valid",  default: 0
    t.integer  "is_people_valid", default: 0
    t.integer  "re_valid",        default: 0
    t.text     "receipt_data",    default: ""
    t.string   "receipt_md5",     default: ""
    t.integer  "status",          default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "images", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "in_app_types", force: true do |t|
    t.string   "display_name"
    t.string   "in_app_type"
    t.text     "description"
    t.string   "apple_id"
    t.string   "apple_bundle_id"
    t.string   "apple_type"
    t.decimal  "price"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ipa_products", force: true do |t|
    t.string   "name",       default: ""
    t.integer  "jine",       default: 0
    t.integer  "jinbi",      default: 0
    t.string   "bid",        default: ""
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "likes", force: true do |t|
    t.integer  "user_id"
    t.integer  "object_id"
    t.integer  "type"
    t.integer  "state",      default: 1
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "message_details", force: true do |t|
    t.integer  "message_id"
    t.string   "title"
    t.text     "content"
    t.integer  "sender_status"
    t.integer  "receive_status"
    t.integer  "isDel"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "sender_userinfo"
    t.string   "p_id",            default: ""
  end

  create_table "messages", force: true do |t|
    t.integer  "sender"
    t.integer  "receive"
    t.string   "last_msg"
    t.integer  "status"
    t.integer  "type"
    t.integer  "isDel"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "sender_userinfo"
    t.string   "p_id",            default: ""
  end

  create_table "online_details", force: true do |t|
    t.string   "media_url"
    t.text     "frames"
    t.text     "description"
    t.integer  "state"
    t.integer  "free"
    t.text     "priview"
    t.text     "auth"
    t.integer  "zan_count"
    t.integer  "share_count"
    t.integer  "online_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.text     "user"
    t.integer  "price"
    t.string   "zip_conver_url"
    t.string   "video_url"
    t.integer  "type"
    t.integer  "order_num"
    t.integer  "upyun_noti"
    t.string   "p_id",           default: ""
  end

  create_table "onlines", force: true do |t|
    t.string   "title"
    t.string   "cover_url"
    t.text     "description"
    t.string   "relation_url"
    t.text     "user"
    t.integer  "user_count"
    t.integer  "image_count"
    t.integer  "zan_count"
    t.datetime "end_day"
    t.text     "zan_user"
    t.integer  "free"
    t.text     "essence"
    t.integer  "state",          default: 1,  null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.integer  "price"
    t.string   "zip_conver_url"
    t.string   "video_url"
    t.integer  "type"
    t.integer  "order_num"
    t.integer  "upyun_noti"
    t.text     "more_details",   default: ""
    t.string   "p_id",           default: ""
  end

  create_table "photos", force: true do |t|
    t.boolean  "buyShow"
    t.boolean  "is_conver"
    t.integer  "album_id"
    t.integer  "status"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
  end

  add_index "photos", ["album_id"], name: "index_photos_on_album_id"

  create_table "posts", force: true do |t|
    t.string   "title"
    t.string   "text"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.string   "post_url"
  end

  create_table "recharges", force: true do |t|
    t.integer  "user_id"
    t.integer  "type"
    t.integer  "type_price"
    t.integer  "success"
    t.text     "pingju_content"
    t.integer  "apple_validate"
    t.integer  "people_validate"
    t.integer  "revalidate"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "relationships", force: true do |t|
    t.integer  "follower_id"
    t.integer  "followed_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "share_lists", force: true do |t|
    t.string   "user_name",             default: ""
    t.integer  "objct_id",              default: 0
    t.integer  "objct_type",            default: 0
    t.integer  "is_zengsong_xingyunbi", default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "taggings", force: true do |t|
    t.integer  "tag_id"
    t.integer  "taggable_id"
    t.string   "taggable_type"
    t.integer  "tagger_id"
    t.string   "tagger_type"
    t.string   "context",       limit: 128
    t.datetime "created_at"
  end

  add_index "taggings", ["tag_id", "taggable_id", "taggable_type", "context", "tagger_id", "tagger_type"], name: "taggings_idx", unique: true
  add_index "taggings", ["taggable_id", "taggable_type", "context"], name: "index_taggings_on_taggable_id_and_taggable_type_and_context"

  create_table "tags", force: true do |t|
    t.string  "name"
    t.integer "taggings_count", default: 0
  end

  add_index "tags", ["name"], name: "index_tags_on_name", unique: true

  create_table "tongjis", force: true do |t|
    t.integer  "all_jinbi",     default: 0
    t.integer  "all_ruanmeibi", default: 0
    t.integer  "luckbi",        default: 0
    t.integer  "all_iap_count", default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "transaction_records", force: true do |t|
    t.integer  "expend_user_id"
    t.integer  "income_user_id"
    t.integer  "goods_id"
    t.integer  "goods_info"
    t.integer  "transaction_type"
    t.integer  "recharge_id"
    t.integer  "price"
    t.integer  "expend"
    t.integer  "income"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "user_jinbis", force: true do |t|
    t.integer  "jinbi",      default: 0
    t.integer  "ruanmeibi",  default: 0
    t.integer  "xingyunbi",  default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "email",                  default: "",  null: false
    t.string   "encrypted_password",     default: "",  null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,   null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.string   "username"
    t.string   "brief"
    t.string   "introduction",           default: ""
    t.string   "authentication_token"
    t.string   "lock"
    t.string   "lockdate"
    t.string   "avatar"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.string   "user_type"
    t.string   "pulish_type"
    t.integer  "sender_type"
    t.string   "sender_id"
    t.string   "balance"
    t.integer  "jinbi",                  default: 0
    t.integer  "rmb",                    default: 0
    t.string   "apple_token",            default: ""
    t.integer  "fans",                   default: 0
    t.integer  "follow",                 default: 0
    t.integer  "like",                   default: 0
    t.integer  "allow_push_message",     default: 1
    t.integer  "rss_num",                default: 0
    t.string   "version",                default: ""
    t.string   "device",                 default: ""
    t.decimal  "longitude",              default: 0.0
    t.decimal  "latitude",               default: 0.0
    t.integer  "sex",                    default: 1
    t.integer  "city_id",                default: 1
    t.string   "city",                   default: "1"
    t.string   "p_id",                   default: ""
  end

  add_index "users", ["authentication_token"], name: "index_users_on_authentication_token", unique: true
  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  add_index "users", ["username"], name: "index_users_on_username", unique: true

  create_table "versions", force: true do |t|
    t.string   "item_type",  null: false
    t.integer  "item_id",    null: false
    t.string   "event",      null: false
    t.string   "whodunnit"
    t.text     "object"
    t.datetime "created_at"
  end

  add_index "versions", ["item_type", "item_id"], name: "index_versions_on_item_type_and_item_id"

  create_table "votes", force: true do |t|
    t.integer  "votable_id"
    t.string   "votable_type"
    t.integer  "voter_id"
    t.string   "voter_type"
    t.boolean  "vote_flag"
    t.string   "vote_scope"
    t.integer  "vote_weight"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "votes", ["votable_id", "votable_type", "vote_scope"], name: "index_votes_on_votable_id_and_votable_type_and_vote_scope"
  add_index "votes", ["voter_id", "voter_type", "vote_scope"], name: "index_votes_on_voter_id_and_voter_type_and_vote_scope"

end
