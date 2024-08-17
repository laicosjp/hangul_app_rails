class RemoveIsCorrectFromWordChoices < ActiveRecord::Migration[7.1]
  def change
    remove_column :word_choices, :is_correct, :boolean
  end
end
