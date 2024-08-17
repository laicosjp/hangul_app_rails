# == Schema Information
#
# Table name: word_choices
#
#  id             :bigint           not null, primary key
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  choice_word_id :bigint           not null
#  word_id        :bigint           not null
#
# Indexes
#
#  index_word_choices_on_choice_word_id  (choice_word_id)
#  index_word_choices_on_word_id         (word_id)
#
# Foreign Keys
#
#  fk_rails_...  (choice_word_id => words.id)
#  fk_rails_...  (word_id => words.id)
#
FactoryBot.define do
  factory :word_choice do
    word { create(:word) }
    choice_word { create(:word) }
  end
end
