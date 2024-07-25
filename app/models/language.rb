# typed: true

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
class Language < ApplicationRecord
  validates :code, presence: true, uniqueness: true
  validates :name, presence: true
  validates :flag, presence: true

  has_many :original_words, class_name: 'Word', dependent: :destroy
  has_many :answer_words, class_name: 'Word', dependent: :destroy
end
