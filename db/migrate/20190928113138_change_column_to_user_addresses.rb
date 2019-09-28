class ChangeColumnToUserAddresses < ActiveRecord::Migration[5.2]
  def up
    change_column :user_addresses, :phone_number, :string
  end
  
  def down
    change_column :user_addresses, :phone_number, :integer
  end
end
