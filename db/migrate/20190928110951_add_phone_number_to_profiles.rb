class AddPhoneNumberToProfiles < ActiveRecord::Migration[5.2]
  def change
    add_column :profiles, :phone_number, :string, null: false
  end
end
