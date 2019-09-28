class UserAddress < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user, optional: true
  belongs_to_active_hash :prefecture
  POSTAL_CODE_VALID = /\A\d{3}-\d{4}\z/i

  validates :postal_code,             presence: true, length: {maximum: 100}, format: { with: POSTAL_CODE_VALID }
  validates :prefecture_id,           presence: true
  validates :city,                    presence: true, length: {maximum: 50}
  validates :first_name_kana,        presence: true, length: {maximum: 35}
  validates :last_name_kana,      presence: true, length: {maximum: 35}
  validates :first_name_kanji,   presence: true, length: {maximum: 35}
  validates :last_name_kanji, presence: true, length: {maximum: 35}
  validates :phone_number,                                     length: {maximum: 100}
end
