class AddPhoneNumberToProfiles < ActiveRecord::Migration[5.2]
  def change
    add_column :profiles, :phone_number, :integer, null:false ,unique:true
  end
end
