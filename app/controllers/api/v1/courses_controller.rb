class Api::V1::CoursesController < ApplicationController
  def index
    @courses = Course.all
  end

  def show
    @course = Course.find(params[:id])
    all_words = @course.words.to_a
    @words = all_words.map do |word|
      dummy_words = all_words.reject { |w| w.id == word.id }.shuffle.take(3)
      word.attributes.transform_keys { |key| key.to_s.camelize(:lower) }.merge(choices: generate_choices([word, *dummy_words]))
    end
  end

  private

    def generate_choices(words)
      words.map do |word|
        word.attributes.transform_keys { |key| key.to_s.camelize(:lower) }.merge(isCorrect: word.id == words.first.id)
      end.shuffle
    end
end
