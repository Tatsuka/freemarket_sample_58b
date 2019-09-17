class AddItems < ActiveRecord::Migration[5.2]
  def change
  end
end



|name|string|null: false|
# |price|integer|null: false|
|detail|text|null: false|
|shipping_cost|integer|null: false|
|shipping_fee_charge_to|integer|null: false|
|shipping_from|integer|null: false|
|shipping_days|integer|null: false|
# |condition|references|null:false,foreign_key: true|
|category|references|null:false,foreign_key:true|
|trade_status|references|null:false,foreign_key:true|
|brand|references|foreign_key: true|