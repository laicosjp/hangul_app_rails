# == Schema Information
#
# Table name: general_announcements
#
#  id         :bigint           not null, primary key
#  body       :string           not null
#  title      :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class GeneralAnnouncement < ApplicationRecord
  validates :title, presence: true
  validates :body, presence: true
end
