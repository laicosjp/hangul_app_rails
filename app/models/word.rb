# == Schema Information
#
# Table name: words
#
#  id          :bigint           not null, primary key
#  answer      :string           not null
#  name        :string           not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  course_id   :bigint           not null
#  language_id :bigint           not null
#
# Indexes
#
#  index_words_on_course_id    (course_id)
#  index_words_on_language_id  (language_id)
#
# Foreign Keys
#
#  fk_rails_...  (course_id => courses.id)
#  fk_rails_...  (language_id => languages.id)
#
class Word < ApplicationRecord
  belongs_to :language
  belongs_to :course

  validates :name, presence: true
  validates :answer, presence: true
end
