class Doctor < ApplicationRecord
  belongs_to :user
  has_many :schedules

  def info
    { id: id, name: name, specialize: specialize, email: user.email }
  end
end
