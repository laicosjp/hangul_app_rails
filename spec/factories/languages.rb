# == Schema Information
#
# Table name: languages
#
#  id            :bigint           not null, primary key
#  code(ISO 639) :string           not null
#  flag          :string           not null
#  name          :string           not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
# Indexes
#
#  index_languages_on_code  (code) UNIQUE
#
FactoryBot.define do
  factory :language do
    name { 'English' }
    sequence(:code) { |n| "en#{n}" }
    flag { '🇬🇧' }
  end
end
