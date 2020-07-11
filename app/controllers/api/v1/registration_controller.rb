class Api::V1::RegistrationController < Api::ApplicationController
  skip_before_action :authenticate_request

  def registration_doctor
    command = UserRegistration.call(
      params, 'doctor'
    )

    if command.success?
      render json: { data: command.result.info }
    else
      render json: { error: command.errors }, status: :internal_server_error
    end
  end

  def registration_patient
    command = UserRegistration.call(
      params, 'patient'
    )

    if command.success?
      render json: { data: command.result.info }
    else
      render json: { error: command.errors }, status: :internal_server_error
    end
  end
end
