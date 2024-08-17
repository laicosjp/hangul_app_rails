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
end
