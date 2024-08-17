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
#  index_word_records_on_user_id  (user_id)
#  index_word_records_on_word_id  (word_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#  fk_rails_...  (word_id => words.id)
#
class WordRecord < ApplicationRecord
  belongs_to :user
  belongs_to :word
end
