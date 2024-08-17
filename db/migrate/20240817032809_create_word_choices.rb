class CreateWordChoices < ActiveRecord::Migration[7.1]
  def change
    create_table :word_choices do |t|
      t.references :word, null: false, foreign_key: true
      t.references :choice_word, null: false, foreign_key: { to_table: :words }

      t.timestamps
    end
  end
end
