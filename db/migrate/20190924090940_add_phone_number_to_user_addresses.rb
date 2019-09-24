class AddPhoneNumberToUserAddresses < ActiveRecord::Migration[5.2]
  def change
    add_column :user_addresses, :phone_number, :integer
  end
end
