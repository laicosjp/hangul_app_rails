# == Schema Information
#
# Table name: courses
#
#  id         :bigint           not null, primary key
#  slug       :string           not null
#  title      :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_courses_on_slug  (slug) UNIQUE
#
class Course < ApplicationRecord
  validates :title, presence: true
  validates :slug, presence: true, uniqueness: true
end
