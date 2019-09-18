class RemoveItemFromItem < ActiveRecord::Migration[5.2]
  def change
    remove_column :items, :item, :string
  end
end
