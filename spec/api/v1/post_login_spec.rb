require 'rails_helper'

describe 'login using email', type: :request do
  let!(:user) { FactoryBot.create(:user, :user_for_doctor) }

  it 'success login and get auth_token' do
    params = { email: 'zoe@doctor.xyz', password: '12345678' }
    post '/api/v1/login', params: params, as: :json
    expect(response).to have_http_status(:success)
  end
  it 'failed login wrong password' do
    params = { email: 'zoe@doctor.xyz', password: '12345678333' }
    post '/api/v1/login', params: params, as: :json
    expect(response).to have_http_status(401)
  end
  it 'failed login wrong email' do
    params = { email: 'zoed@doctord.xyz', password: '12345678' }
    post '/api/v1/login', params: params, as: :json
    expect(response).to have_http_status(401)
  end


end
