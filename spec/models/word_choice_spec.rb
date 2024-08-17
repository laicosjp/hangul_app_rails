# == Schema Information
#
# Table name: word_choices
#
#  id             :bigint           not null, primary key
#  is_correct     :boolean
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  choice_word_id :bigint           not null
#  word_id        :bigint           not null
#
# Indexes
#
#  index_word_choices_on_choice_word_id  (choice_word_id)
#  index_word_choices_on_word_id         (word_id)
#
# Foreign Keys
#
#  fk_rails_...  (choice_word_id => words.id)
#  fk_rails_...  (word_id => words.id)
#
require 'rails_helper'

RSpec.describe WordChoice, type: :model do
   describe '#associations' do
    it { is_expected.to belong_to(:word) }
    it { is_expected.to belong_to(:choice_word).class_name('Word') }
  end
end
