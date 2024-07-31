# == Schema Information
#
# Table name: general_announcements
#
#  id         :bigint           not null, primary key
#  body       :string           not null
#  title      :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
FactoryBot.define do
  factory :general_announcement do
    title { Faker::Lorem.word }
    body { Faker::Lorem.sentence }
  end
end
