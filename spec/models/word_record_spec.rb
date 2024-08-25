# == Schema Information
#
# Table name: word_records
#
#  id                         :bigint           not null, primary key
#  first_studied_at           :datetime
#  last_studied_at            :datetime
#  next_scheduled_question_at :datetime
#  status                     :integer
#  step                       :integer          default("zero"), not null
#  created_at                 :datetime         not null
#  updated_at                 :datetime         not null
#  user_id                    :bigint           not null
#  word_id                    :bigint           not null
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
    it { should validate_presence_of(:first_studied_at) }
  end

  describe '#methods' do
    describe '#next_step' do
      context 'when the step is one_minute_later' do
        let(:word_record) { create(:word_record, step: 'one_minute_later') }

        it 'returns ten_minutes_later' do
          expect(word_record.next_step).to eq('ten_minutes_later')
        end
      end

      context 'when the step is ninety_days_later' do
        let(:word_record) { create(:word_record, step: 'ninety_days_later') }

        it 'returns the same value' do
          expect(word_record.next_step).to eq('ninety_days_later')
        end
      end
    end

    describe '#previous_step' do
      context 'when the step is ninety_days_later' do
        let(:word_record){ create(:word_record, step: 'ninety_days_later') }
 
        it 'returns three_days_later' do
          expect(word_record.previous_step).to eq('three_days_later')
        end
      end

      context 'when the step is ten_minutes_later' do
        let(:word_record) { create(:word_record, step: 'ten_minutes_later') }

        it 'returns one_minute_later' do
          expect(word_record.previous_step).to eq('zero')
        end
      end
 
      context 'when the step is zero' do
        let(:word_record) { create(:word_record, step: 'zero') }

        it 'returns the same value' do
          expect(word_record.previous_step).to eq('zero')
        end
      end
    end
  end
end
