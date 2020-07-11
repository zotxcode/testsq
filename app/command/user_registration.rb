class UserRegistration
  prepend SimpleCommand

  def initialize(form, type)
    @form = form
    @type = type
  end

  def call
    registration_user
  end

  private

  attr_accessor :form, :type

  def registration_user
    user_exist = User.find_by_email(form[:email])
    if user_exist
      errors.add :message, 'User already exists with this email'
      return nil
    end
    user = User.new({ email: form[:email], password: form[:password], facebook_uid: form[:facebook_uid], google_uid: form[:google_uid] })
    if type == 'doctor'
      user.build_doctor({ name: form[:name], specialize: form[:specialize] })
      user.roles.build({ name: :doctor })
    else
      user.build_patient({ name: form[:name], dob: form[:dob], gender: form[:gender], phone: form[:phone] })
      user.roles.build({ name: :patient })
    end

    if user.save
      user
    else
      errors.add :message, 'Something when wrong!!'
      nil
    end
  end

end
