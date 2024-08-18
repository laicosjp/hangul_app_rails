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
FactoryBot.define do
  factory :word do
    name { 'Hello' }
    answer { 'こんにちは' }
    course { create(:course) }
    original_language { create(:language) }
    answer_language { create(:language) }
  end
end
