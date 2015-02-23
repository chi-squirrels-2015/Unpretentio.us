class User < ActiveRecord::Base
  has_secure_password

  has_many :urls

  validates :email, presence: true, uniqueness: true, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }



  def self.by_email(email)
    find_by(email: email.downcase)
  end

  def self.authenticate(email, password)
    by_email(email).try(:authenticate, password)
  end

  private
  def sanitize_email
    self.email.downcase!
  end
end
