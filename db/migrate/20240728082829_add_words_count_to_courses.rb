class AddWordsCountToCourses < ActiveRecord::Migration[7.1]
  def self.up
    add_column :courses, :words_count, :integer, null: false, default: 0
  end

  def self.down
    remove_column :courses, :words_count
  end
end
