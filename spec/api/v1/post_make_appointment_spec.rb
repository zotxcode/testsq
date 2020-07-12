require 'rails_helper'

describe 'make appointment', type: :request do
  let!(:patient) { FactoryBot.create(:patient, :true_patient) }
  let!(:schedules) { FactoryBot.create_list(:schedule, 20, :random_schedule) }

  it 'success login and get auth_token' do
    params = { email: 'mark@patient.xyz', password: '12345678' }
    post '/api/v1/login', params: params, as: :json
    expect(response).to have_http_status(:success)
  end

  after do
    auth_token = JSON.parse(response.body)['data']['auth_token'] rescue ''
    schedule_id = Schedule.first.id
    post '/api/v1/patient/make_appointment', params: { schedule_id: schedule_id }, as: :json, headers: { Authorization: auth_token }
    expect(response).to have_http_status(:success)
  end

end
