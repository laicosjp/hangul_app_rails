class AddUniqueIndexToWordChoicesAndWordRecords < ActiveRecord::Migration[7.1]
  def change
    add_index :word_choices, [:word_id, :choice_word_id], unique: true
    add_index :word_records, [:word_id, :user_id], unique: true
  end
end
