class User < ApplicationRecord
  rolify
  has_one :doctor
  has_one :patient
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def self.authenticate(email, password)
    user = User.find_for_authentication(email: email)
    user&.valid_password?(password) ? user : nil
  end

  def info
    { auth_token: JsonWebToken.encode(user_id: id), id: id, email: email }
  end
end
