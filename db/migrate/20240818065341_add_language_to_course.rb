class AddLanguageToCourse < ActiveRecord::Migration[7.1]
  def change
    add_reference :courses, :original_language, foreign_key: { to_table: :languages }
    add_reference :courses, :answer_language, foreign_key: { to_table: :languages }
  end
end
