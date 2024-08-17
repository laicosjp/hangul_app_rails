# == Schema Information
#
# Table name: courses
#
#  id            :bigint           not null, primary key
#  slug          :string           not null
#  thumbnail_url :string
#  title         :string           not null
#  words_count   :integer          default(0), not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
# Indexes
#
#  index_courses_on_slug  (slug) UNIQUE
#
class Course < ApplicationRecord
  validates :title, presence: true
  validates :slug, presence: true, uniqueness: true
  validates :thumbnail_url, url: true

  has_many :words, dependent: :destroy

  def words_selected_by_records(user_id:, status: nil)
    words.where(id: WordRecord.where(user_id:, status:).pluck(:word_id))
  end
end
