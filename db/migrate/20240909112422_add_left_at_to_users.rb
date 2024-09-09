class AddLeftAtToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :left_at, :datetime
  end
end
