# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20081229222417) do

  create_table "pictures", :force => true do |t|
    t.integer  "post_id"
    t.string   "caption"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "parent_id"
    t.string   "content_type"
    t.string   "filename"
    t.string   "thumbnail"
    t.integer  "size"
    t.integer  "width"
    t.integer  "height"
  end

  add_index "pictures", ["parent_id"], :name => "index_pictures_on_parent_id"
  add_index "pictures", ["post_id"], :name => "index_pictures_on_post_id"

  create_table "posts", :force => true do |t|
    t.string   "title"
    t.text     "text"
    t.integer  "picture_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
