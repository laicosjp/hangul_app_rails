# typed: true

class Api::V1::CoursesController < ApplicationController
  DEFAULT_ORIGINAL_LANGUAGE = 'ko'
  DEFAULT_ANSWER_LANGUAGE = 'jp'

  before_action :authenticate_user!, only: :show

  def index
    original = params[:original_language] || DEFAULT_ORIGINAL_LANGUAGE
    answer = params[:answer_language] || DEFAULT_ANSWER_LANGUAGE

    @courses = Course.by_languages(original:, answer:)
  end

  def show
    @course = Course.find(params[:id])
    @example_words = @course.words.includes(:choices).first(Word::EXAMPLE_WORDS_COUNT)
    @corrected_words_count = @course.words.selected_by_records(user_id: current_user.id, status: 'correct').length
    @incorrected_words_count = @course.words.selected_by_records(user_id: current_user.id, status: 'incorrect').length
    @unstudied_words_count = @course.words_count - (@corrected_words_count + @incorrected_words_count)
  end
end
