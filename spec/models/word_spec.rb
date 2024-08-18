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
require 'rails_helper'

RSpec.describe Word, type: :model do
  describe '#validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:answer) }
  end
end
