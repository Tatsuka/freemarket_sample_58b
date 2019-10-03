class DeleteProfiles < ActiveRecord::Migration[5.2]
  def up
    drop_table :profiles
  end
  def down
    create_table "profiles", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
      t.string "avatar", null: false
      t.string "first_name_kana", null: false
      t.string "last_name_kana", null: false
      t.string "first_name_kanji", null: false
      t.string "last_name_kanji", null: false
      t.bigint "user_id", null: false
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
      t.date "birthday", null: false
      t.text "introduction"
      t.string "phone_number", null: false
    end
  end
end
