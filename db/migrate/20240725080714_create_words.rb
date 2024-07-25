class CreateWords < ActiveRecord::Migration[7.1]
  def change
    create_table :words do |t|
      t.string :name, null: false
      t.string :answer, null: false
      t.references :course, null: false, foreign_key: true
      t.references :original_language, null: false, foreign_key: { to_table: :languages }
      t.references :answer_language, null: false, foreign_key: { to_table: :languages }

      t.timestamps
    end
  end
end
