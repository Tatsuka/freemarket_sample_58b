class User < ApplicationRecord
  has_many :comments
  has_many :items
  has_many :transaction_partners
  has_one :sns_credentials , dependent: :destroy
  has_one :credit_card , dependent: :destroy
  has_one :profile
  has_one :user_address , dependent: :destroy
  
# Include default devise modules. Others available are:
# :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

devise :database_authenticatable, :registerable,
       :recoverable, :rememberable, :validatable, :omniauthable

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  PASSWORD_VALIDATION = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{7,128}+\z/i
  validates :email,                 presence: true, uniqueness: { case_sensitive: false }, format: { with: VALID_EMAIL_REGEX }
  validates :password,              presence: true, length: {minimum: 7, maximum: 128},    format: { with: PASSWORD_VALIDATION }
  validates :password_confirmation, presence: true, length: {minimum: 7, maximum: 128}
  validates :nickname,              presence: true, length: {maximum: 20}
end
