class CreateWordRecords < ActiveRecord::Migration[7.1]
  def change
    create_table :word_records do |t|
      t.references :user, null: false, foreign_key: true
      t.references :word, null: false, foreign_key: true
      t.integer :status
      t.datetime :studied_at

      t.timestamps
    end
  end
end
