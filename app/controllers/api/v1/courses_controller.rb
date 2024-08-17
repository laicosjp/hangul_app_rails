class Api::V1::CoursesController < ApplicationController
  def index
    @courses = Course.all
  end

  def show
    @course = Course.find(params[:id])
    @words = @course.words.includes(:choices).first(Word::EXAMPLE_WORDS_COUNT)
  end
end
