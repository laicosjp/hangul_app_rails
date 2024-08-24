# == Schema Information
#
# Table name: word_records
#
#  id               :bigint           not null, primary key
#  first_studied_at :datetime
#  last_studied_at  :datetime
#  status           :integer
#  step             :integer          default(0), not null
#  studied_at       :datetime
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
class WordRecord < ApplicationRecord
  belongs_to :user
  belongs_to :word

  enum status: { correct: 1, incorrect: 2 }
  enum step: {
    # This integer value is based on the key name. The unit is minute.
    # ex)
    #  one_minute_later is 1.
    #  one_hour_later is 60,
    zero: 0,
    one_minute_later: 1,
    ten_minutes_later: 10,
    thirty_minutes_later: 30,
    one_hour_later: 60,
    seven_hour_later: 420,
    one_day_later: 1440,
    three_days_later: 4320,
    ten_days_later: 14_400,
    thirty_days_later: 43_200,
    fourty_five_days_later: 64_800,
    sixty_days_later: 86_400,
    ninety_days_later: 129_600
  }

  validates :studied_at, presence: true
  validates :word_id, uniqueness: { scope: :user_id }
end
