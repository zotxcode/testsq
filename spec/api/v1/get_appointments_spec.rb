require 'rails_helper'

describe 'get list appointments', type: :request do
  let!(:appointments) { FactoryBot.create_list(:appointment, 1, :random_appointment) }

  it 'success login and get auth_token' do
    params = { email: 'zoe@doctor.xyz', password: '12345678' }
    post '/api/v1/login', params: params, as: :json
    expect(response).to have_http_status(:success)
  end

  after do
      auth_token = JSON.parse(response.body)['data']['auth_token'] rescue ''
      get '/api/v1/doctor/appointments?limit=10&offset=0', headers: { Authorization: auth_token }
      expect(JSON.parse(response.body)['data'].size).to eq(1)
  end


end
