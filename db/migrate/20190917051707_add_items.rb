class AddDetailsToItems < ActiveRecord::Migration[5.2]
  def change
    add_column :items, :item, :string, null: false
    add_column :items, :detail, :text, null: false
    add_column :items, :shipping_cost, :integer, null: false
    add_column :items, :shipping_fee_charge_to, :string, null: false
    add_column :items, :shipping_from, :integer, null: false
    add_column :items, :shipping_days, :string, null: false
    add_column :items, :category_id, :bigint, null: false, foreign_key:true
    add_column :items, :trade_status_id, :bigint, null: false, foreign_key:true
    add_column :items, :brand_id, :bigint, foreign_key:true
  end
end
