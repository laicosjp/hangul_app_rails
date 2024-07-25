# == Schema Information
#
# Table name: courses
#
#  slug       :string           not null
#  title      :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_courses_on_slug  (slug) UNIQUE
#
FactoryBot.define do
  factory :course do
    slug { Faker::Internet.slug }
    title { Faker::Lorem.sentence }
  end
end
