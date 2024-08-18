# == Schema Information
#
# Table name: courses
#
#  id                   :bigint           not null, primary key
#  slug                 :string           not null
#  thumbnail_url        :string
#  title                :string           not null
#  words_count          :integer          default(0), not null
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#  answer_language_id   :bigint
#  original_language_id :bigint
#
# Indexes
#
#  index_courses_on_answer_language_id    (answer_language_id)
#  index_courses_on_original_language_id  (original_language_id)
#  index_courses_on_slug                  (slug) UNIQUE
#
# Foreign Keys
#
#  fk_rails_...  (answer_language_id => languages.id)
#  fk_rails_...  (original_language_id => languages.id)
#
FactoryBot.define do
  factory :course do
    slug { Faker::Internet.slug }
    title { Faker::Lorem.sentence }
    thumbnail_url { Faker::Internet.url }
    original_language { create(:language) }
    answer_language { create(:language) }
  end
end
