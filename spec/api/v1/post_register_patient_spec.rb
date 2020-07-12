require 'rails_helper'

describe 'register patient', type: :request do
  let!(:patient) { FactoryBot.create(:patient, :true_patient) }

  params = {
    email: Faker::Internet.email,
    password: '12345678',
    name: Faker::Name.name,
    dob: Faker::Date.between(from: 60.years.ago, to: 1.years.ago),
    gender: Faker::Gender.binary_type.downcase,
    phone: Faker::PhoneNumber.cell_phone
  }
  it 'success register and get auth_token' do
    post '/api/v1/register/patient', params: params, as: :json
    expect(response).to have_http_status(:success)
  end
  it 'failed register email already exist' do
    params[:email] = 'mark@patient.xyz'
    post '/api/v1/register/patient', params: params, as: :json
    expect(response).to have_http_status(500)
  end
  it 'failed register without email' do
    params[:email] = ''
    post '/api/v1/register/patient', params: params, as: :json
    expect(response).to have_http_status(500)
  end
  it 'failed register without password' do
    params[:password] = ''
    post '/api/v1/register/patient', params: params, as: :json
    expect(response).to have_http_status(500)
  end
end
