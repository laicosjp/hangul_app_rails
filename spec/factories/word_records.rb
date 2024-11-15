# == Schema Information
#
# Table name: word_records
#
#  id                         :bigint           not null, primary key
#  first_studied_at           :datetime
#  last_studied_at            :datetime         default(Mon, 26 Aug 2024 11:53:39.996116000 JST +09:00), not null
#  next_scheduled_question_at :datetime         default(Mon, 26 Aug 2024 11:53:39.998520000 JST +09:00), not null
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
FactoryBot.define do
  factory :word_record do
    user { create(:user) }
    word { create(:word) }
    status { 'correct' }
    step { WordRecord.steps.keys.sample }
    first_studied_at { Time.current }
    last_studied_at { Time.current }
    next_scheduled_question_at { Time.current.tomorrow }
  end
end
