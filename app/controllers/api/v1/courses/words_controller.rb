class Api::V1::Courses::WordsController < ApplicationController
  before_action :set_course

  def show
    @words = @course.words.eager_load(:choices).page(params[:page]).per(params[:per_page])
  end

  private

    def set_course
      @course = Course.find(params[:course_id])
    end
end
