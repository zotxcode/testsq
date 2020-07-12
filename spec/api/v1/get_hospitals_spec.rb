require 'rails_helper'

describe 'get all hospitals route', type: :request do
  let!(:hospitals) { FactoryBot.create_list(:hospital, 20, :random) }
  before { get '/api/v1/hospitals' }
  it 'returns all hospitals with default limit 10' do
    expect(JSON.parse(response.body)['data'].size).to eq(10)
  end
  it 'returns status code 200' do
    expect(response).to have_http_status(:success)
  end

  offset_first = []
  it 'returns all hospitals with limit 15' do
    get '/api/v1/hospitals?limit=15&offset=0'
    offset_first = JSON.parse(response.body)
    expect(offset_first['data'].size).to eq(15)
  end
  it 'must return 15 not default 10' do
    expect(offset_first['data'].size).not_to eq(10)
  end

  offset_second = []
  it 'returns all hospitals next offset 15' do
    get '/api/v1/hospitals?limit=15&offset=15'
    offset_second = JSON.parse(response.body)
    expect(offset_first['data']).not_to eq(offset_second['data'])
  end

  it 'returns empty because data only 20' do
    get '/api/v1/hospitals?limit=15&offset=30'
    expect(JSON.parse(response.body)['data'].size).to eq(0)
  end

end
