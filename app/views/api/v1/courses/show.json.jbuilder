json.partial! 'api/v1/courses/course', course: @course
json.words @course.words do |word|
  json.partial! 'api/v1/words/word', word: word
end
