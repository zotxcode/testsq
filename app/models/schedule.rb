class Schedule < ApplicationRecord
  belongs_to :hospital
  belongs_to :doctor
  has_many :appointments

  def self.active_schedules(limit, offset)
    Schedule.connection.select_all("SELECT a.id as schedule_id, a.start_at, a.end_at, a.max_patient, a.book_close_in_minute, b.name as hospital_name, c.name as doctor_name
      FROM schedules as a
      LEFT JOIN hospitals as b ON a.hospital_id = b.id
      LEFT JOIN doctors as c ON a.doctor_id = c.id
      ORDER BY a.start_at ASC
      OFFSET '#{offset}' LIMIT '#{limit}' ").to_a
  end

end
