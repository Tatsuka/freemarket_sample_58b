class CreateTransactions < ActiveRecord::Migration[5.2]
  def change
    create_table :transactions do |t|
      t.references    :status, null:false, foreign_key:true
      t.references    :item, null:false, foreign_key:true
      t.references    :transaction_partner, null:false, foreign_key:true
      t.timestamps
    end
  end
end
