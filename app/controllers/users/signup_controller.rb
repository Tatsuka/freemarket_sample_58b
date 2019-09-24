class SignupController < ApplicationController

  ptivate
  def user_params
    params.require(:user).permit(
      :nickname,
      :e_mail,
      :password,
      :password_confirmation
      profile_attributes: [
        :id,
        :last_name_kanji,
        :first_name_kanji,
        :last_name_kana,
        :first_name_kana,
        :brithday
      ],
      address_attributes: [
        :id,
        :phone_number,
        :postal_code,
        :prefecture,
        :city,
        :block_number,
        :building_name
      ],
      credit_card_attributes: [
        :id,
        :card_number,
        :security_code,
        :expiry_year,
        :expiry_month
      ]
    )
  end
end
