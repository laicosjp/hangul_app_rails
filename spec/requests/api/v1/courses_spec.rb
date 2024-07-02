require 'rails_helper'

RSpec.describe "Api::V1::Courses", type: :request do
  describe "GET /index" do
    it "returns a successful response" do
      get api_v1_courses_path
      expect(response).to have_http_status(:success)
    end

    it "returns a list of courses" do
      create_list(:course, 3)
      get api_v1_courses_path
      json = JSON.parse(response.body)
      expect(json.size).to eq(3)
    end
  end
end
