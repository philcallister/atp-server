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

ActiveRecord::Schema.define(:version => 20110727192449) do

  create_table "alerts", :force => true do |t|
    t.integer  "position_id"
    t.date     "date"
    t.string   "comment"
    t.string   "action"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "positions", :force => true do |t|
    t.date     "date_open"
    t.date     "date_closed"
    t.string   "ticker"
    t.string   "price"
    t.string   "change"
    t.string   "percent"
    t.string   "direction"
    t.decimal  "start_price",         :precision => 10, :scale => 4
    t.decimal  "max_price",           :precision => 10, :scale => 4
    t.decimal  "scale_in_low_price",  :precision => 10, :scale => 4
    t.decimal  "scale_in_high_price", :precision => 10, :scale => 4
    t.decimal  "scale_out_price",     :precision => 10, :scale => 4
    t.string   "report_url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
