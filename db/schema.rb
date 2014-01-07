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

ActiveRecord::Schema.define(:version => 20140103192212) do

  create_table "backuplogs", :force => true do |t|
    t.datetime "backup_log_date"
    t.datetime "start_date"
    t.string   "status"
    t.integer  "days_pending"
    t.integer  "user_id"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  create_table "batches", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "date"
    t.integer  "no_of_items"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "change_types", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "item_attribute_details", :force => true do |t|
    t.string   "item_id"
    t.string   "attribute_id"
    t.string   "value"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "items", :force => true do |t|
    t.string   "item_code"
    t.string   "item_name"
    t.string   "item_attribute"
    t.string   "size"
    t.decimal  "buying_price",       :precision => 10, :scale => 0
    t.string   "source"
    t.integer  "tax_class"
    t.integer  "warehouse"
    t.decimal  "markup",             :precision => 10, :scale => 0
    t.decimal  "calculated_selling", :precision => 10, :scale => 0
    t.decimal  "adjusted_price",     :precision => 10, :scale => 0
    t.string   "custom_size"
    t.string   "custom_attribute"
    t.datetime "created_at",                                        :null => false
    t.datetime "updated_at",                                        :null => false
    t.string   "item_description"
    t.string   "original_price"
    t.string   "dosage"
    t.string   "manufacturer"
    t.boolean  "cvs_import"
    t.string   "old_item_number"
  end

  create_table "roles", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "taxcodes", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.string   "market_name"
    t.decimal  "percentage_markup", :precision => 10, :scale => 0
    t.string   "other_info"
    t.datetime "created_at",                                       :null => false
    t.datetime "updated_at",                                       :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "user_name"
    t.string   "password"
    t.string   "email"
    t.string   "salt"
    t.integer  "is_locked"
    t.integer  "archived"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "warehouses", :force => true do |t|
    t.string   "name"
    t.string   "location"
    t.string   "address"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

end
