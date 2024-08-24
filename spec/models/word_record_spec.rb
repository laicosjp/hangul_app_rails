# == Schema Information
#
# Table name: word_records
#
#  id               :bigint           not null, primary key
#  first_studied_at :datetime
#  last_studied_at  :datetime
#  status           :integer
#  step             :integer          default("zero"), not null
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  user_id          :bigint           not null
#  word_id          :bigint           not null
#
# Indexes
#
#  index_word_records_on_user_id              (user_id)
#  index_word_records_on_word_id              (word_id)
#  index_word_records_on_word_id_and_user_id  (word_id,user_id) UNIQUE
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#  fk_rails_...  (word_id => words.id)
#
require 'rails_helper'

RSpec.describe WordRecord, type: :model do
  describe '#associations' do
    it { should belong_to(:user) }
    it { should belong_to(:word) }
  end

  describe '#validations' do
    it { should validate_presence_of(:studied_at) }
  end
end
