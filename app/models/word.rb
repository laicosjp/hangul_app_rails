# == Schema Information
#
# Table name: words
#
#  id         :bigint           not null, primary key
#  answer     :string           not null
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  course_id  :bigint           not null
#
# Indexes
#
#  index_words_on_course_id  (course_id)
#
# Foreign Keys
#
#  fk_rails_...  (course_id => courses.id)
#
# typed: true

class Word < ApplicationRecord
  EXAMPLE_WORDS_COUNT = 30

  validates :name, presence: true
  validates :answer, presence: true

  belongs_to :course
  counter_culture :course

  has_many :word_choices, dependent: :destroy
  has_many :choices, through: :word_choices, source: :choice_word
  has_many :records, class_name: 'WordRecord', dependent: :destroy

  scope :selected_by_records, lambda { |user_id:, status: nil|
    if WordRecord.statuses.include?(status)
      # Get the list of words that have been studied.
      # If status is 'correct', return the words that have been answered correctly.
      # If status is 'incorrect', return the words that have been answered incorrectly.
      joins(:records).where(records: { user_id:, status: }).order(id: :asc)
    else
      # Get the list of words that have not been studied yet.
      where.missing(:records).order(id: :asc)
    end
  }

  scope :selected_by_next_schedule, lambda { |user_id:|
    left_joins(:records)
      .where(records: { user_id:, next_scheduled_question_at: ..Time.current })
      .or(where.not(
            id: WordRecord.where(user_id:).select(:word_id)
          ))
      # === Order by the above priority. ===
      # 1. "status": "correct(2)" → "incorrect(1)" → nil(0)
      # 2. "step": large → small
      # 3. "next_scheduled_question_at": old → new
      .order(Arel.sql('CASE WHEN records.status IS NULL THEN 0 ELSE records.status END DESC, records.step DESC, records.next_scheduled_question_at ASC'))
  }
end
