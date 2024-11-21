require 'rails_helper'

RSpec.describe "Api::V2::Courses", type: :request do
  let!(:course) { create_list(:course, 10) }

  describe "GET /courses" do
    it "returns a success response" do
      get api_v2_courses_path
      expect(response).to be_successful
      expect(JSON.parse(response.body).length).to eq(10)
    end
  end

  describe "GET /courses/:id" do
    it "returns a success response" do
      get api_v2_course_path(course.first)
      expect(response).to be_successful
      expect(JSON.parse(response.body)["id"]).to eq(course.first.id)
    end
  end
end
