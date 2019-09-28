class Profile < ApplicationRecord
  belongs_to :user, optional: true
  validates :birthday,                presence: true
  validates :first_name_kana,             presence: true, length: {maximum: 35}
  validates :last_name_kana,           presence: true, length: {maximum: 35}
  validates :first_name_kanji,        presence: true, length: {maximum: 35}
  validates :last_name_kanji,      presence: true, length: {maximum: 35}
  validates :phone_number,                                     length: {maximum: 100}
  validates :avatar,                  presence: true
end
