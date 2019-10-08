class SnsCredential < ApplicationRecord
  belongs_to :user, optional: true

  validates :user_id, presence: true
  validates :uid, presence: true
  validates :provider, presence: true

end
