json.extract! word, :id, :name, :answer
json.choices word.choices.shuffle do |choice|
  json.extract! choice, :id, :name, :answer
  json.is_correct word.id == choice.id
end
