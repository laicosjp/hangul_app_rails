# == Schema Information
#
# Table name: word_choices
#
#  id             :bigint           not null, primary key
#  is_correct     :boolean          default(FALSE), not null
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
class WordChoice < ApplicationRecord
  belongs_to :word
  belongs_to :choice_word, class_name: 'Word'

  validates :word_id, uniqueness: { scope: :choice_word_id }
  validate :validate_correctness

  private

    def validate_correctness
      return if !is_correct? || word_id == choice_word_id

      errors.add(:is_correct, 'can only be true if the word and choice_word are the same')
    end
end