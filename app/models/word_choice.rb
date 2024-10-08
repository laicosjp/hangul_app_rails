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
#  index_word_choices_on_choice_word_id              (choice_word_id)
#  index_word_choices_on_word_id                     (word_id)
#  index_word_choices_on_word_id_and_choice_word_id  (word_id,choice_word_id) UNIQUE
#
# Foreign Keys
#
#  fk_rails_...  (choice_word_id => words.id)
#  fk_rails_...  (word_id => words.id)
#
class WordChoice < ApplicationRecord
  belongs_to :word
  belongs_to :choice_word, class_name: 'Word'

  validates :word_id, uniqueness: { scope: :choice_word_id }
end
