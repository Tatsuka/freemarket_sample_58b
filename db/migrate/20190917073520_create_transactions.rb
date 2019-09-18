class CreateTransactions < ActiveRecord::Migration[5.2]
  def change
    create_table :transactions do |t|
      t.bigint     :status_id, null:false, foreign_key:true
      t.bigint     :item_id, null:false, foreign_key:true
      t.bigint     :transaction_partner_id, null:false, foreign_key:true
      t.timestamps
    end
  end
end
