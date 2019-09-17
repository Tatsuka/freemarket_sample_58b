class CreateTransactionPartners < ActiveRecord::Migration[5.2]
  def change
    create_table :transaction_partners do |t|
      t.references    :buyer, null:false, foreign_key:true
      t.references    :seller, null:false, foreign_key:true
      t.timestamps
    end
  end
end