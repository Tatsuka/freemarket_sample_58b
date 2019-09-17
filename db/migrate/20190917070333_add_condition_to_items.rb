class AddConditionToItems < ActiveRecord::Migration[5.2]
  def change
    add_bigint :items_id, :condition,null:false, foreign_key:true
  end
end
