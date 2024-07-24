require 'rails_helper'

RSpec.describe "Api::V1::Courses", type: :request do
  describe "GET /courses" do
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

  describe "GET /courses/:id" do
    let(:course) { create(:course) }

    it "returns a successful response" do
      get api_v1_course_path(course)
      expect(response).to have_http_status(:success)
    end

    it "returns NotFound when course not found" do
      get api_v1_course_path(9999)
      expect(response).to have_http_status(:not_found)
    end
  end


end
