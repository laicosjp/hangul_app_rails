# typed: true

class Batch::UserBatch
  def self.update_default_user_name
    User.find_each do |user|
      next if user.name.present?

      user.update(name: 'アルダ初心者')
    end
  end
end
