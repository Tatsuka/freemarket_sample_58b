class AddPrefectureToItems < ActiveRecord::Migration[5.2]
  def change
    add_column :items, :prefecture_id, :bigint, null:false
  end
end
