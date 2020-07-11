class Appointment < ApplicationRecord
  belongs_to :schedule
  belongs_to :patient

  def self.list_appointments_by_doctor(doctor_id, limit, offset)
    Appointment.connection.select_all("SELECT a.book_at, b.start_at, b.end_at,
      c.name as hospital_name, d.name as doctor_name, e.name as patient_name FROM appointments as a
      LEFT JOIN schedules as b ON a.schedule_id = b.id
      LEFT JOIN hospitals as c ON b.hospital_id = c.id
      LEFT JOIN doctors as d ON b.doctor_id = d.id
      LEFT JOIN patients as e ON a.patient_id = e.id
      WHERE c.id = '#{doctor_id}'
      OFFSET '#{offset}' LIMIT '#{limit}' ").to_a
  end

end
