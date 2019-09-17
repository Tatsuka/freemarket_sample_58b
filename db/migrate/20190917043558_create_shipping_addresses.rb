class CreateShippingAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :shipping_addresses do |t|
      t.string      :first_name_kana, null:false
      t.string      :last_name_kana, null:false
      t.string      :first_name_kanji, null:false
      t.string      :last_name_kanji, null:false
      t.integer     :postal_code, null:false
      t.references  :prefecture, null:false, foreign_key:true
      t.string      :city, null:false
      t.integer     :block_number
      t.string      :building_name
      t.integer     :phone_number, null:false, unique:true
      t.references  :user, null:false, foreign_key:true
      t.timestamps
    end
  end
end