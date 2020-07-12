require 'rails_helper'

describe 'get all doctors route', type: :request do
  let!(:doctors) { FactoryBot.create_list(:doctor, 20, :random_doctor) }
  before { get '/api/v1/doctors' }
  it 'returns all doctors with default limit 10' do
    expect(JSON.parse(response.body)['data'].size).to eq(10)
  end
  it 'returns status code 200' do
    expect(response).to have_http_status(:success)
  end

  offset_first = []
  it 'returns all doctors with limit 15' do
    get '/api/v1/doctors?limit=15&offset=0'
    offset_first = JSON.parse(response.body)
    expect(offset_first['data'].size).to eq(15)
  end
  it 'must return 15 not default 10' do
    expect(offset_first['data'].size).not_to eq(10)
  end

  offset_second = []
  it 'returns all doctors next offset 15' do
    get '/api/v1/doctors?limit=15&offset=15'
    offset_second = JSON.parse(response.body)
    expect(offset_first['data']).not_to eq(offset_second['data'])
  end

  it 'returns empty because data only 20' do
    get '/api/v1/doctors?limit=15&offset=30'
    expect(JSON.parse(response.body)['data'].size).to eq(0)
  end

end
