class CreateTransactionPartners < ActiveRecord::Migration[5.2]
  def change
    create_table :transaction_partners do |t|
      t.bigint     :buyer_id, null:false, foreign_key:true
      t.bigint     :seller_id, null:false, foreign_key:true
      t.timestamps
    end
  end
end