class RemovePhoneNumberFromUserAddresses < ActiveRecord::Migration[5.2]
  def change
    remove_column :user_addresses, :phone_number, :integer
  end
end
