class User < ApplicationRecord
  has_secure_password
  validates_presence_of :email
  validates_uniqueness_of :email
  validates_presence_of :password

  has_many :favorites
  has_many :locations, through: :favorites

  def self.validate_new(new_info)
    if new_info[:password] == new_info[:password_confirmation]
      u = User.new(email: new_info[:email],
              password: new_info[:password],
              api_key: SecureRandom.hex(10))
      u.save
    end
  end
end
