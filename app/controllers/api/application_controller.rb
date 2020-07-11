module Api
  class ApplicationController < ActionController::API
    before_action :authenticate_request
    attr_reader :current_api_user

    private

    def authenticate_request
      @current_api_user = AuthorizeApiRequest.call(request.headers).result

      unless @current_api_user
        render json: { error: 'This is not a authorized request.' },
               status: :unauthorized
      end
    end

    def doctor_only
      unless @current_api_user.has_role? :doctor
        render json: { error: 'This is not a authorized request.' },
               status: :unauthorized
      end
    end

    def patient_only
      unless @current_api_user.has_role? :patient
        render json: { error: 'This is not a authorized request.' },
               status: :unauthorized
      end
    end
  end
end
