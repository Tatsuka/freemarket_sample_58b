class SignupController < ApplicationController

  before_action :validates_for_payment, only: :create

  def index
  end

  def registration
    @user = User.new
    @profile = Profile.new
  end

  def sms_confirmation
    @profile = Profile.new
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
    #profile_params
    session[:last_name_kanji] = profile_params[:last_name_kanji]
    session[:first_name_kanji] = profile_params[:first_name_kanji]
    session[:last_name_kana] = profile_params[:last_name_kana]
    session[:first_name_kana] = profile_params[:first_name_kana]
    session[:birthday] = date_create
    @user = User.new(
      nickname: session[:nickname],
      email: session[:email],
      password: session[:password],
      password_confirmation: session[:password_confirmation]
    )
    @profile = Profile.new(
        user: @user,
        introduction: " ",
        phone_number: "12345678901",
        avatar: "/public/default.jpg",
        last_name_kanji: session[:last_name_kanji],
        first_name_kanji: session[:first_name_kanji],
        last_name_kana: session[:last_name_kana],
        first_name_kana: session[:first_name_kana],
        birthday: session[:birthday]
    )
    
    if @user.valid? && @profile.valid?
      redirect_to sms_confirmation_signup_index_path
    else
      render 'signup/registration'
    end
  end

  def validates_for_confirmation
    session[:phone_number] = profile_params[:phone_number]
    @user = User.new(
      nickname: session[:nickname],
      email: session[:email],
      password: session[:password],
      password_confirmation: session[:password_confirmation]
    )
    @profile = Profile.new(
      user: @user,
      introduction: " ",
      phone_number: session[:phone_number],
      avatar: "/public/default.jpg",
      last_name_kanji: session[:last_name_kanji],
      first_name_kanji: session[:first_name_kanji],
      last_name_kana: session[:last_name_kana],
      first_name_kana: session[:first_name_kana],
      birthday: session[:birthday]
    )
    if @user.valid? && @profile.valid?
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
    @user = User.new(
      nickname: session[:nickname],
      email: session[:email],
      password: session[:password],
      password_confirmation: session[:password_confirmation]
    )
    @profile = Profile.new(
      user: @user,
      introduction: " ",
      phone_number: session[:phone_number],
      avatar: "/public/default.jpg",
      last_name_kanji: session[:last_name_kanji],
      first_name_kanji: session[:first_name_kanji],
      last_name_kana: session[:last_name_kana],
      first_name_kana: session[:first_name_kana],
      birthday: session[:birthday]
    )
    @user_address = UserAddress.new(
      user: @user,
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
    if @profile.valid? && @user_address.valid?
      redirect_to payment_signup_index_path
    else
      render 'signup/address'
    end
  end

  def validates_for_payment
    session[:card_number] = credit_card_params[:card_number]
    session[:security_code] = credit_card_params[:security_code]
    session[:expiry_year] = credit_card_params[:expiry_year]
    session[:expiry_month] = credit_card_params[:expiry_month]
    @user = User.new(
      nickname: session[:nickname],
      email: session[:email],
      password: session[:password],
      password_confirmation: session[:password_confirmation]
    )
    @profile = Profile.new(
      user: @user,
      introduction: " ",
      phone_number: session[:phone_number],
      avatar: "/public/default.jpg",
      last_name_kanji: session[:last_name_kanji],
      first_name_kanji: session[:first_name_kanji],
      last_name_kana: session[:last_name_kana],
      first_name_kana: session[:first_name_kana],
      birthday: session[:birthday]
    )
    @user_address = UserAddress.new(
      user: @user,
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
      user: @user,
      card_number: session[:card_number],
      security_code: session[:security_code],
      expiry_year: session[:expiry_year],
      expiry_month: session[:expiry_month]
    )
    
    unless @credit_card.valid?
      render 'signup/payment'
    end
  end

  def create
    @user = User.new(
      nickname: session[:nickname],
      email: session[:email],
      password: session[:password],
      password_confirmation: session[:password_confirmation]
    )
    unless @user.save
      reset_session
      redirect_to signup_index_path
      return
    end
    @profile = Profile.create(
      user: @user,
      introduction: " ",
      phone_number: session[:phone_number],
      avatar: "/public/default.jpg",
      last_name_kanji: session[:last_name_kanji],
      first_name_kanji: session[:first_name_kanji],
      last_name_kana: session[:last_name_kana],
      first_name_kana: session[:first_name_kana],
      birthday: session[:birthday]
    )
    @credit_card = CreditCard.new(
      user: @user,
      card_number: session[:card_number],
      security_code: session[:security_code],
      expiry_year: session[:expiry_year],
      expiry_month: session[:expiry_month]
    )
    if @credit_card.save
      reset_session
      session[:id] = @user.id
      sign_in User.find(session[:id]) unless user_signed_in?
      redirect_to complete_signup_index_path
      return
    else
      reset_session
      redirect_to signup_index_path
    end
  end

  private

  def user_params
    params.require(:user).permit(
      :nickname,
      :email,
      :password,
      :password_confirmation,
      )
  end

  def profile_params
    params.require(:profile).permit(
      :id,
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
      :id,
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
      :id,
      :card_number,
      :security_code,
      :expiry_year,
      :expiry_month
    )
    
  end

  def date_create
    date = params[:profile]
    Date.new date["birthday(1i)"].to_i,date["birthday(2i)"].to_i,date["birthday(3i)"].to_i
  end
end