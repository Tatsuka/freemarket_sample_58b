class AddConditionToItems < ActiveRecord::Migration[5.2]
  def change
    add_reference :items, :condition,null:false, foreign_key: true
  end
end
