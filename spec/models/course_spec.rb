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
require 'rails_helper'

RSpec.describe Course, type: :model do
  describe "#validates" do
    it { should validate_presence_of(:slug) }
    it { should validate_presence_of(:title) }
  end
end
