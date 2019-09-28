class AddNameToUserAddresses < ActiveRecord::Migration[5.2]
  def change
    add_column :user_addresses, :first_name_kana, :string, null: false
    add_column :user_addresses, :last_name_kana, :string, null: false
    add_column :user_addresses, :first_name_kanji, :string, null: false
    add_column :user_addresses, :last_name_kanji, :string, null: false
  end
end
