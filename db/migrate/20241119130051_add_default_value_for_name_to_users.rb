class AddDefaultValueForNameToUsers < ActiveRecord::Migration[7.1]
  def change
    change_column_null :users, :name, false, "アルダ初心者"
    change_column_default :users, :name, from: nil, to: 'アルダ初心者'
  end
end
