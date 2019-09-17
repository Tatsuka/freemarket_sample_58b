class CreateCategoriesBrands < ActiveRecord::Migration[5.2]
  def change
    create_table :categories_brands do |t|
      t.bigint    :category_id, null:false, foreign_key:true
      t.bigint    :brand_id, null:false, foreign_key:true
      t.timestamps
    end
  end
end