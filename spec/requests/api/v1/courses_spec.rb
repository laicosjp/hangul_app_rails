require 'rails_helper'

RSpec.describe 'Api::V1::Courses', type: :request do
  describe 'GET /courses' do
    before do
      create_list(:course, 3)
    end

    it 'returns a successful response' do
      get api_v1_courses_path
      expect(response).to have_http_status(:success)
    end

    it 'returns a list of courses' do
      get api_v1_courses_path
      json = JSON.parse(response.body)
      expect(json.size).to eq(3)
    end
  end

  describe 'GET /courses/:id' do
    let(:user) { create(:user) }
    let(:course) { create(:course) }
    let!(:word) { create_list(:word, 20, course: course) }
    let!(:token) { user.create_new_auth_token }

    it 'returns a successful response' do
      get api_v1_course_path(course), headers: token
      expect(response).to have_http_status(:success)
    end

    it 'returns NotFound when course not found' do
      get api_v1_course_path(9999), headers: token
      expect(response).to have_http_status(:not_found)
    end
  end
end
