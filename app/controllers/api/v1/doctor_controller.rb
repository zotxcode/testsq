class Api::V1::DoctorController < Api::ApplicationController
  before_action :doctor_only
  before_action :check_params_limit_and_offset

  def appointments
    doctor_id = @current_api_user.doctor.id
    data = Appointment.list_appointments_by_doctor(doctor_id, @limit, @offset)
    render json: { meta: { limit: @limit, offset: @offset }, data: data }
  end
end
