# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_05_08_064429) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "uuid-ossp"

  create_table "code_runners", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    
    
    t.string "code_file_path"
    t.string "input_test_file_path"
    t.string "language"
    t.integer "time_limit"
    t.string "status"
    t.uuid "session_id", default: -> { "uuid_generate_v4()" }
    t.string "time_taken"
    t.string "output_test_file_path"
    t.index ["session_id"], name: "index_code_runners_on_session_id"
  end

end
