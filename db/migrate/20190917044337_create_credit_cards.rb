class CreateCreditCards < ActiveRecord::Migration[5.2]
  def change
    create_table :credit_cards do |t|
      t.bigint        :user_id, null:false,foreign_key:true
      t.integer       :card_number, null:false
      t.integer       :security_code,null:false
      t.integer       :expiry_year, null:false
      t.integer       :expiry_month, null:false
      t.timestamps
    end
  end
end