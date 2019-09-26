class ChangeColumnToAllowNull < ActiveRecord::Migration[5.2]
  def up
    change_column :items, :trade_status_id, :bigint, null: true
  end

  def down
    change_column :items, :trade_status_id, :bigint, null: false
  end
end
