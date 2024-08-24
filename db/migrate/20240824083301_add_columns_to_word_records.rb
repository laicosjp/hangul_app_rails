class AddColumnsToWordRecords < ActiveRecord::Migration[7.1]
  def change
    add_column :word_records, :step, :integer, default: 0, null: false
    rename_column :word_records, :studied_at, :first_studied_at
    add_column :word_records, :last_studied_at, :datetime
  end
end
