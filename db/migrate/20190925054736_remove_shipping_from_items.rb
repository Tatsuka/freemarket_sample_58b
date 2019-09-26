class RemoveShippingFromItems < ActiveRecord::Migration[5.2]
  def change
    remove_column :items, :shipping_from, :string
  end
end
