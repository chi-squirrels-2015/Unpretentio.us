class User < ActiveRecord::Base
  has_secure_password

  has_many :urls

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
