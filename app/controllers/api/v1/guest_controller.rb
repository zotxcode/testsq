class Api::V1::GuestController < Api::ApplicationController
  skip_before_action :authenticate_request
  before_action :check_params_limit_and_offset

  def active_doctors
    data = []
    Doctor.all.limit(@limit).offset(@offset).each do |doc|
      data.push(doc.info)
    end
    render json: { meta: { limit: @limit, offset: @offset }, data: data }
  end

  def active_hospitals
    data = []
    Hospital.all.limit(@limit).offset(@offset).each do |h|
      data.push(h.info)
    end
    render json: { meta: { limit: @limit, offset: @offset }, data: data }
  end

  def active_schedules
    data = Schedule.active_schedules(@limit, @offset)
    render json: { meta: { limit: @limit, offset: @offset }, data: data }
  end

end
