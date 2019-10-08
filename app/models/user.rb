class User < ApplicationRecord
  has_many :comments
  has_many :items
  has_many :transaction_partners
  has_many :sns_credentials , dependent: :destroy
  has_one :credit_card , dependent: :destroy
  has_one :user_address , dependent: :destroy

devise :database_authenticatable, :registerable,
       :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: %i[facebook google_oauth2]
  
  def self.without_sns_data(auth)
    user = User.where(email: auth.info.email).first
      if user.present?
        sns = SnsCredential.create(
          uid: auth.uid,
          provider: auth.provider,
          user_id: user.id
        )
      else
        user = User.new(
          nickname: auth.info.name,
          email: auth.info.email,
        )
        sns = SnsCredential.new(
          uid: auth.uid,
          provider: auth.provider
        )
      end
      return { user: user ,sns: sns}
    end

  def self.with_sns_data(auth, snscredential)
    user = User.where(id: snscredential.user_id).first
    unless user.present?
      user = User.new(
        nickname: auth.info.name,
        email: auth.info.email,
      )
    end
    return {user: user}
  end

  def self.find_oauth(auth)
    uid = auth.uid
    provider = auth.provider
    snscredential = SnsCredential.where(uid: uid, provider: provider).first
    if snscredential.present?
      user = with_sns_data(auth, snscredential)[:user]
      sns = snscredential
    else
      user = without_sns_data(auth)[:user]
      sns = without_sns_data(auth)[:sns]
    end
    return { user: user ,sns: sns}
  end

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  PASSWORD_VALIDATION = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{7,128}+\z/i
  validates :email,                 presence: true, uniqueness: { case_sensitive: false }, format: { with: VALID_EMAIL_REGEX }
  validates :password,              presence: true, length: {minimum: 7, maximum: 128},    format: { with: PASSWORD_VALIDATION }
  validates :password_confirmation, presence: true, length: {minimum: 7, maximum: 128}
  validates :nickname,              presence: true, length: {maximum: 20}
  validates :birthday,                presence: true
  validates :first_name_kana,             presence: true, length: {maximum: 35}
  validates :last_name_kana,           presence: true, length: {maximum: 35}
  validates :first_name_kanji,        presence: true, length: {maximum: 35}
  validates :last_name_kanji,      presence: true, length: {maximum: 35}
  validates :phone_number,                                     length: {maximum: 100}

  has_one_attached :avatar
end
