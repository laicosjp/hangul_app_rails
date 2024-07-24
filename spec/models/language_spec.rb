# == Schema Information
#
# Table name: languages
#
#  id            :bigint           not null, primary key
#  code(ISO 639) :string           not null
#  flag          :string           not null
#  name          :string           not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
# Indexes
#
#  index_languages_on_code  (code) UNIQUE
#
require 'rails_helper'

RSpec.describe Language, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
