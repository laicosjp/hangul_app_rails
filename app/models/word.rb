# == Schema Information
#
# Table name: words
#
#  id                   :bigint           not null, primary key
#  answer               :string           not null
#  name                 :string           not null
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#  answer_language_id   :bigint           not null
#  course_id            :bigint           not null
#  original_language_id :bigint           not null
#
# Indexes
#
#  index_words_on_answer_language_id    (answer_language_id)
#  index_words_on_course_id             (course_id)
#  index_words_on_original_language_id  (original_language_id)
#
# Foreign Keys
#
#  fk_rails_...  (answer_language_id => languages.id)
#  fk_rails_...  (course_id => courses.id)
#  fk_rails_...  (original_language_id => languages.id)
#
# typed: true

class Word < ApplicationRecord
  EXAMPLE_WORDS_COUNT = 30

  validates :name, presence: true
  validates :answer, presence: true

  belongs_to :course
  counter_culture :course
  belongs_to :original_language, class_name: 'Language'
  belongs_to :answer_language, class_name: 'Language'

  has_many :word_choices, dependent: :destroy
  has_many :choices, through: :word_choices, source: :choice_word
  has_many :records, class_name: 'WordRecord', dependent: :destroy

  sig { params(user_id: Integer, status: String).returns(ActiveRecord::Relation) }
  scope :selected_by_records, lambda { |user_id:, status: nil|
    if status.blank?
      # Get the list of words that have not been studied yet.
      where.missing(:records).order(id: :asc)
    else
      # Get the list of words that have been studied.
      # If status is 'correct', return the words that have been answered correctly.
      # If status is 'incorrect', return the words that have been answered incorrectly.
      joins(:records).where(records: { user_id:, status: }).order(id: :asc)
    end
  }
end
