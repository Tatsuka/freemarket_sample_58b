class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      # t.references :user_id ,null:false, foreign_key:true
      t.text :comment, null:false
      t.string :condition, null:false
      t.integer :price, null:false
      t.timestamps
    end
  end
end