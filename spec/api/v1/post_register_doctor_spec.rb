require 'rails_helper'

describe 'register doctor', type: :request do
  let!(:doctor) { FactoryBot.create(:doctor, :true_doctor) }

  params = {
    email: Faker::Internet.email,
    password: '12345678',
    name: Faker::Name.name,
    specialize: Faker::Lorem.sentence
  }
  it 'success register and get auth_token' do
    post '/api/v1/register/doctor', params: params, as: :json
    expect(response).to have_http_status(:success)
  end
  it 'failed register email already exist' do
    params[:email] = 'zoe@doctor.xyz'
    post '/api/v1/register/doctor', params: params, as: :json
    expect(response).to have_http_status(500)
  end
  it 'failed register without email' do
    params[:email] = ''
    post '/api/v1/register/doctor', params: params, as: :json
    expect(response).to have_http_status(500)
  end
  it 'failed register without password' do
    params[:password] = ''
    post '/api/v1/register/doctor', params: params, as: :json
    expect(response).to have_http_status(500)
  end
end
