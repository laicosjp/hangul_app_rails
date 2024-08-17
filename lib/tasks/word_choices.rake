namespace :word_choices do
  task set_random: :environment do
    word_ids_with_choices = WordChoice.distinct(:word_id).uniq

    word_choices_list = []
    Course.find_each do |course|
      print('==============')
      print('Course: ', course.title, "\n")

      course.words.where.not(id: word_ids_with_choices).find_each do |word|
        print('Word: ', word.name, "\n")

        word_choices_list << { word_id: word.id, choice_word_id: word.id, is_correct: true }
        course.words.where.not(id: word.id).all.sample(3).each do |choice|
          word_choices_list << { word_id: word.id, choice_word_id: choice.id, is_correct: false }
        end
      end
    end

    WordChoice.import!(word_choices_list)
  end
end
