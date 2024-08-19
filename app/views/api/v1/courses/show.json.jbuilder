json.partial! 'api/v1/courses/course', course: @course
json.corrected_words_count @corrected_words_count
json.incorrected_words_count @incorrected_words_count
json.example_words do
  json.array! @example_words, partial: 'api/v1/words/word', as: :word
end

