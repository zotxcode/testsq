class Api::V1::GuestController < Api::ApplicationController
  skip_before_action :authenticate_request

  def active_doctors
    data = []
    Doctor.all.limit(params[:limit]).offset(params[:offset]).each do |doc|
      data.push(doc.info)
    end
    render json: { meta: { limit: params[:limit], offset: params[:offset] }, data: data }
  end

  def active_hospitals
    data = []
    Hospital.all.limit(params[:limit]).offset(params[:offset]).each do |h|
      data.push(h.info)
    end
    render json: { meta: { limit: params[:limit], offset: params[:offset] }, data: data }
  end

  def active_schedules
    data = Schedule.active_schedules(params[:limit], params[:offset])
    render json: { meta: { limit: params[:limit], offset: params[:offset] }, data: data }
  end
end
