class Hospital < ApplicationRecord
  has_many :schedules

  def info
    { id: id, name: name, address: address, city: city, phone: phone, email: email }
  end
end
