json.partial! 'api/v1/courses/course', course: @course
json.example_words do
  json.array! @words, partial: 'api/v1/words/word', as: :word
end
