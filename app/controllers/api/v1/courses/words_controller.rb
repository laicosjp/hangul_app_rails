class Api::V1::Courses::WordsController < ApplicationController
  before_action :set_course

  def show
    @words = @course.words.includes(:choices)
  end

  private

    def set_course
      @course = Course.find(params[:course_id])
    end
end
