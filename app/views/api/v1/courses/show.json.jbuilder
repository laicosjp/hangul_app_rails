json.partial! 'api/v1/courses/course', course: @course
json.words @words do |word|
  json.word word 
end

