# == Schema Information
#
# Table name: word_records
#
#  id         :bigint           not null, primary key
#  status     :integer
#  studied_at :datetime
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint           not null
#  word_id    :bigint           not null
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
    user { nil }
    word { nil }
    status { 1 }
    studied_at { "2024-08-17 17:53:48" }
  end
end
