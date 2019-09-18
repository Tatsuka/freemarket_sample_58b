class CreateUserAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :user_addresses do |t|
      t.bigint     :user_id, null:false, foreign_key: true
      t.integer    :phone_number, null:false ,unique:true
      t.integer    :postal_code, null:false
      t.bigint     :prefecture_id, null:false, unique:true
      t.string     :city, null:false
      t.integer    :block_number
      t.string     :building_name
      t.timestamps
    end
  end
end
