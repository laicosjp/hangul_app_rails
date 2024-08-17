require 'rails_helper'

RSpec.describe "Api::V1::Courses::Words", type: :request do
  let(:course) { create(:course) }
  let(:words) { create_list(:word, 50, course: course) }

  describe "GET /" do
    it "returns http success" do
      get api_v1_course_words_path(course_id: course.id)
      expect(response).to have_http_status(:success)
    end
  end
end
