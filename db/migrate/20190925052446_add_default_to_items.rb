class AddDefaultToItems < ActiveRecord::Migration[5.2]
  def change
    change_column_default :items, :trade_status_id, 1
  end
end
