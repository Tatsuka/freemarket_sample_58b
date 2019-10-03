class AddColumnsToUsers < ActiveRecord::Migration[5.2]
  def up
    add_column :users, :first_name_kana, :string, null: false
    add_column :users, :last_name_kana, :string, null: false
    add_column :users, :first_name_kanji, :string, null: false
    add_column :users, :last_name_kanji, :string, null: false
    add_column :users, :birthday, :date, null: false
    add_column :users, :introduction, :text
    add_column :users, :phone_number, :string, null: false
  end

  def down
    remove_column :users, :first_name_kana, :string, null: false
    remove_column :users, :last_name_kana, :string, null: false
    remove_column :users, :first_name_kanji, :string, null: false
    remove_column :users, :last_name_kanji, :string, null: false
    remove_column :users, :birthday, :date, null: false
    remove_column :users, :introduction, :text
    remove_column :users, :phone_number, :string, null: false
  end
end
