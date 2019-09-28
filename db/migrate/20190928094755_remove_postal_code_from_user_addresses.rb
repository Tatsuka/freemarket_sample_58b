class RemovePostalCodeFromUserAddresses < ActiveRecord::Migration[5.2]
  def change
    remove_column :user_addresses, :postal_code, :integer
  end
end
