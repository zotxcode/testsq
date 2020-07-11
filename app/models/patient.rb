class Patient < ApplicationRecord
  belongs_to :user
  has_many :appointments
  enum gender: { male: 0, female: 1 }

  def info
    { id: id, name: name, dob: dob, gender: gender, phone: phone, email: user.email }
  end
end
