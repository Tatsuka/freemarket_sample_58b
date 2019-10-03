class ChangeColumnToItem < ActiveRecord::Migration[5.2]

  def up
    change_column :items, :trade_status_id, :bigint, null: true
  end
  
  def down
    change_column :items, :trade_status_id, :bigint, null: false
  end
  
  def change
    change_column_default :items, :trade_status_id, 1
    remove_column :items, :price, :integer
    remove_column :items, :shipping_from, :string
    add_column :items, :prefecture_id, :bigint, null:false
  end
end


