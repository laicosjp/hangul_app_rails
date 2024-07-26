# == Schema Information
#
# Table name: courses
#
#  id            :bigint           not null, primary key
#  slug          :string           not null
#  thumbnail_url :string
#  title         :string           not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
# Indexes
#
#  index_courses_on_slug  (slug) UNIQUE
#
FactoryBot.define do
  factory :course do
    slug { Faker::Internet.slug }
    title { Faker::Lorem.sentence }
    thumbnail_url { Faker::Internet.url }
  end
end
