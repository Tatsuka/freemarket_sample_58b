class CreateTrades < ActiveRecord::Migration[5.2]
  def change
    create_table :trades do |t|
      t.bigint     :status_id, null: false
      t.bigint     :item_id, null: false
      t.bigint     :transaction_partner_id, null: false
      t.datetime   :created_at, null: false
      t.datetime   :updated_at, null: false
    end
  end
end
