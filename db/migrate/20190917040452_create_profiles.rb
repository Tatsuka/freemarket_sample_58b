class CreateProfiles < ActiveRecord::Migration[5.2]
  def change
    create_table :profiles do |t|
      t.text         :introduction, null:false
      t.string       :avatar, null:false
      t.string       :first_name_kana, null:false
      t.string       :last_name_kana, null:false
      t.string       :first_name_kanji, null:false
      t.string       :last_name_kanji, null:false
      t.integer      :birth_year, null:false
      t.integer      :birth_month, null:false
      t.integer      :birth_day, null:false
      t.bigint       :user_id, null:false, foreign_key:true
      t.timestamps
    end
  end
end