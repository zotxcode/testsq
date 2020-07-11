class Api::V1::PatientController < Api::ApplicationController
  before_action :patient_only

  def make_appointment
    patient = @current_api_user.patient
    schedule = Schedule.find(params[:schedule_id])
    close_at = (schedule.start_at - schedule.book_close_in_minute.minutes).strftime('%Y-%m-%d %H:%M').to_datetime
    current_time = Time.now.strftime('%Y-%m-%d %H:%M').to_datetime

    unless current_time < close_at
      render json: { error: 'Time is up!' }
      return
    end

    unless schedule.appointments.where(patient: patient).blank?
      render json: { error: 'Appointment has been scheduled!' }
      return
    end

    unless schedule.appointments.size <= schedule.max_patient
      render json: { message: 'Appointment in already full schedule, please select another schedule!' }
      return
    end

    patient.appointments.build(schedule: schedule, book_at: schedule.start_at)
    if patient.save
      render json: { success: 'Appointment has been scheduled on ' + schedule.start_at.strftime('%d %b %Y %H:%M') + ' .' }
    else
      render json: { error: patient.errors }, status: :internal_server_error
    end
  end
end
