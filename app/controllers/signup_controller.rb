class SignupController < ApplicationController

  before_action :validates_for_registration, only: :sms_confirmation
  before_action :validates_for_address, only: :payment
  before_action :validates_for_payment, only: :create

  def index
  end

  def registration
    @user = User.new
  end

  def sms_confirmation
    @user = User.new
  end

  def address
    @user_address = UserAddress.new
  end

  def payment
    @credit_card = CreditCard.new
  end

  def validates_for_registration
    #user_params
    session[:nickname] = user_params[:nickname]
    session[:email] = user_params[:email]
    session[:password] = user_params[:password]
    session[:password_confirmation] = user_params[:password_confirmation]
    session[:last_name_kanji] = user_params[:last_name_kanji]
    session[:first_name_kanji] = user_params[:first_name_kanji]
    session[:last_name_kana] = user_params[:last_name_kana]
    session[:first_name_kana] = user_params[:first_name_kana]
    session[:birthday] = date_create
    @user = User.new(
      nickname: session[:nickname],
      email: session[:email],
      password: session[:password],
      password_confirmation: session[:password_confirmation],
      introduction: " ",
      phone_number: "12345678901",
      last_name_kanji: session[:last_name_kanji],
      first_name_kanji: session[:first_name_kanji],
      last_name_kana: session[:last_name_kana],
      first_name_kana: session[:first_name_kana],
      birthday: session[:birthday]
    )
    unless @user.valid?
      render 'signup/registration'
    end
  end

  def validates_for_confirmation
    session[:phone_number] = user_params[:phone_number]
    @user = User.new(
      nickname: session[:nickname],
      email: session[:email],
      password: session[:password],
      password_confirmation: session[:password_confirmation],
      phone_number: session[:phone_number],
      last_name_kanji: session[:last_name_kanji],
      first_name_kanji: session[:first_name_kanji],
      last_name_kana: session[:last_name_kana],
      first_name_kana: session[:first_name_kana],
      birthday: session[:birthday]
    )
    if @user.valid?
      if session[:provider].present? && session[:uid].present?
        password = Devise.friendly_token.first(7)
        @user = User.create(
          nickname:session[:nickname],
          email: session[:email],
          password: "password",
          password_confirmation: "password",
          phone_number: session[:phone_number],
          last_name_kanji: session[:last_name_kanji],
          first_name_kanji: session[:first_name_kanji],
          last_name_kana: session[:last_name_kana],
          first_name_kana: session[:first_name_kana],
          birthday: session[:birthday]
        )
        sns = SnsCredential.create(
          user_id: @user.id, 
          uid: session[:uid], 
          provider: session[:provider]
        )
      else
        @user = User.create(
          nickname: session[:nickname],
          email: session[:email],
          password: session[:password],
          password_confirmation: session[:password_confirmation],
          phone_number: session[:phone_number],
          last_name_kanji: session[:last_name_kanji],
          first_name_kanji: session[:first_name_kanji],
          last_name_kana: session[:last_name_kana],
          first_name_kana: session[:first_name_kana],
          birthday: session[:birthday]
        )
      end
      sign_in User.find(@user.id)
      redirect_to address_signup_index_path
    else
      render 'signup/sms_confirmation'
    end
  end

  def validates_for_address
    session[:last_name_kanji] = user_address_params[:last_name_kanji]
    session[:first_name_kanji] = user_address_params[:first_name_kanji]
    session[:last_name_kana] = user_address_params[:last_name_kana]
    session[:first_name_kana] = user_address_params[:first_name_kana]
    session[:phone_number] = user_address_params[:phone_number]
    session[:postal_code] = user_address_params[:postal_code]
    session[:prefecture_id] = user_address_params[:prefecture_id]
    session[:city] = user_address_params[:city]
    session[:block_number] = user_address_params[:block_number]
    session[:building_name] = user_address_params[:building_name]
    @user_address = UserAddress.new(
      user_id: current_user.id,
      last_name_kanji: session[:last_name_kanji],
      first_name_kanji: session[:first_name_kanji],
      last_name_kana: session[:last_name_kana],
      first_name_kana: session[:first_name_kana],
      phone_number: session[:phone_number],
      postal_code: session[:postal_code],
      prefecture_id: session[:prefecture_id],
      city: session[:city],
      block_number: session[:block_number],
      building_name: session[:building_name]
    )
    unless @user_address.valid?
      render 'signup/address'
    end
  end

  def validates_for_payment
    session[:card_number] = credit_card_params[:card_number]
    session[:security_code] = credit_card_params[:security_code]
    session[:expiry_year] = credit_card_params[:expiry_year]
    session[:expiry_month] = credit_card_params[:expiry_month]
    @user_address = UserAddress.new(
      user_id: current_user.id,
      last_name_kanji: session[:last_name_kanji],
      first_name_kanji: session[:first_name_kanji],
      last_name_kana: session[:last_name_kana],
      first_name_kana: session[:first_name_kana],
      phone_number: session[:phone_number],
      postal_code: session[:postal_code],
      prefecture_id: session[:prefecture_id],
      city: session[:city],
      block_number: session[:block_number],
      building_name: session[:building_name]
    )
    @credit_card = CreditCard.new(
      user_id: current_user.id,
      card_number: session[:card_number],
      security_code: session[:security_code],
      expiry_year: session[:expiry_year],
      expiry_month: session[:expiry_month]
    )
    unless @user_address.valid? && @credit_card.valid?
      render 'signup/payment'
    end
  end

  def create
    @user_address = UserAddress.create(
      user_id: current_user.id,
      last_name_kanji: session[:last_name_kanji],
      first_name_kanji: session[:first_name_kanji],
      last_name_kana: session[:last_name_kana],
      first_name_kana: session[:first_name_kana],
      phone_number: session[:phone_number],
      postal_code: session[:postal_code],
      prefecture_id: session[:prefecture_id],
      city: session[:city],
      block_number: session[:block_number],
      building_name: session[:building_name]
    )
    @credit_card = CreditCard.create(
      user_id: current_user.id,
      card_number: session[:card_number],
      security_code: session[:security_code],
      expiry_year: session[:expiry_year],
      expiry_month: session[:expiry_month]
    )
    
    unless user_signed_in?
      sign_in User.find(session[:id])
    end
    redirect_to complete_signup_index_path
  end

  private

  def user_params
    params.require(:user).permit(
      :nickname,
      :email,
      :password,
      :password_confirmation,
      :phone_number,
      :last_name_kanji,
      :first_name_kanji,
      :last_name_kana,
      :first_name_kana,
      :birthday
      )
  end

  def user_address_params
    params.require(:user_address).permit(
      :user_id,
      :last_name_kanji,
      :first_name_kanji,
      :last_name_kana,
      :first_name_kana,
      :phone_number,
      :postal_code,
      :prefecture_id,
      :city,
      :block_number,
      :building_name
    )
  end

  def credit_card_params
    params.require(:credit_card).permit(
      :user_id,
      :card_number,
      :security_code,
      :expiry_year,
      :expiry_month
    )
    
  end

  def date_create
    date = params[:user]
    Date.new date["birthday(1i)"].to_i,date["birthday(2i)"].to_i,date["birthday(3i)"].to_i
  end
end
