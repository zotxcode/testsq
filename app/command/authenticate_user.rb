class AuthenticateUser
  prepend SimpleCommand

  def initialize(email, password)
    @email = email
    @password = password
  end

  def call
    api_user
  end

  private

  attr_accessor :email, :password

  def api_user
    user = User.authenticate(email, password)
    unless user.present?
      errors.add :message, 'Invalid email / password'
      return nil
    end

    user
  end
end
