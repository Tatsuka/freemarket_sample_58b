class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string        :name, null:false
      t.integer       :price, null:false
      t.text          :detail, null:false
      t.integer       :shipping_cost, null:false
      t.integer       :shipping_fee_charge_to, null:false
      t.integer       :shipping_from, null:false
      t.integer       :shipping_days, null:false
      t.bigint        :condition_id, null:false, foreign_key:true
      t.bigint        :category_id, null:false, foreign_key:true
      t.bigint        :trade_status_id, null:false, foreign_key:true
      t.bigint        :brand_id, foreign_key:true
      t.timestamps
    end
  end
end