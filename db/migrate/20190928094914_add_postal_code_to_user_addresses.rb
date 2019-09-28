class AddPostalCodeToUserAddresses < ActiveRecord::Migration[5.2]
  def change
    add_column :user_addresses, :postal_code, :string, null:false
  end
end
