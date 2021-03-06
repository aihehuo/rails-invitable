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

ActiveRecord::Schema.define(version: 20171106100937) do

  create_table "rails_invitable_red_pocket_records", force: :cascade do |t|
    t.string "referable_type"
    t.integer "referable_id"
    t.decimal "amount", precision: 8, scale: 2, default: "0.0", null: false
    t.boolean "incoming", default: true, null: false
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["referable_type", "referable_id"], name: "index_referable"
    t.index ["user_id"], name: "index_rails_invitable_red_pocket_records_on_user_id"
  end

  create_table "rails_invitable_referrals", force: :cascade do |t|
    t.string "code"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["code"], name: "index_rails_invitable_referrals_on_code"
    t.index ["user_id"], name: "index_rails_invitable_referrals_on_user_id"
  end

  create_table "rails_invitable_user_accepted_referrals", force: :cascade do |t|
    t.integer "user_id"
    t.integer "referral_id", null: false
    t.datetime "registered_at"
    t.datetime "completed_at"
    t.string "phone", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["phone"], name: "index_rails_invitable_user_accepted_referrals_on_phone"
    t.index ["referral_id"], name: "index_rails_invitable_user_accepted_referrals_on_referral_id"
    t.index ["user_id"], name: "index_rails_invitable_user_accepted_referrals_on_user_id"
  end

  create_table "rails_invitable_withdraws", force: :cascade do |t|
    t.decimal "amount", precision: 8, scale: 2, default: "0.0", null: false
    t.integer "user_id", null: false
    t.text "transfer", null: false
    t.text "response"
    t.integer "channel", null: false
    t.string "order_no", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "success", default: false
    t.index ["order_no"], name: "index_rails_invitable_withdraws_on_order_no"
    t.index ["user_id"], name: "index_rails_invitable_withdraws_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "admin", default: false, null: false
    t.decimal "red_pocket", precision: 8, scale: 2, default: "0.0"
  end

end
