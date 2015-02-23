class Url < ActiveRecord::Base
  belongs_to :user

  before_validation :set_uid
  validates :uid, presence: true
  validates :origin, presence: true
  validates :user, presence: true

  validates_uniqueness_of :origin, scope: :user_id

  private
  def set_uid
    require 'SecureRandom'
    self.uid = SecureRandom.urlsafe_base64(5)
  end
end
