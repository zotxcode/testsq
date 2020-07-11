class Api::V1::DoctorController < Api::ApplicationController
  before_action :doctor_only

  def appointments
    doctor_id = @current_api_user.doctor.id
    data = Appointment.list_appointments_by_doctor(doctor_id, params[:limit], params[:offset])
    render json: { meta: { limit: params[:limit], offset: params[:offset] }, data: data }
  end
end
