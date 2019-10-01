class DropTableTransactions < ActiveRecord::Migration[5.2]
  def change
    drop_table :Transactions
  end
end
