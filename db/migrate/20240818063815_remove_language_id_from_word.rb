class RemoveLanguageIdFromWord < ActiveRecord::Migration[7.1]
  def change
    remove_index :words, :answer_language_id
    remove_index :words, :original_language_id
    remove_column :words, :original_language_id
    remove_column :words, :answer_language_id
  end
end
