class Api::V1::AuthenticationController < Api::ApplicationController
  skip_before_action :authenticate_request

  def authenticate
    command = AuthenticateUser.call(
      params[:email], params[:password]
    )

    if command.success?
      render json: { data: command.result.info }
    else
      render json: { error: command.errors }, status: :unauthorized
    end
  end

  def login_socmed
    if params[:uid].blank?
      render json: { error: 'please check your input parameters' }, status: :bad_request
    else
      user = User.new
      if params[:provider] == 'facebook'
        user = User.find_by_facebook_uid(params[:uid])
      elsif params[:provider] == 'google'
        user = User.find_by_google_uid(params[:uid])
      end

      if user
        render json: { data: user.info }
      else
        render json: { error: 'User not found' }
      end
    end
  end

end
