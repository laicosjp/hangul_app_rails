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
require 'rails_helper'

RSpec.describe GeneralAnnouncement, type: :model do
  describe '#validations' do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:body) }
  end
end
