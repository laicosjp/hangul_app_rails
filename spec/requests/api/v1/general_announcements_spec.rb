require 'rails_helper'

RSpec.describe 'Api::V1::GeneralAnnouncements', type: :request do
  let!(:genral_announcement) { create(:general_announcement) }

  describe 'GET /' do
    before { get '/api/v1/general_announcements' }

    it 'returns general announcements' do
      expect(response.body).to include(genral_announcement.title)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET /:id' do
    before { get "/api/v1/general_announcements/#{genral_announcement.id}" }

    it 'returns general announcement' do
      expect(response.body).to include(genral_announcement.title)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end
end
