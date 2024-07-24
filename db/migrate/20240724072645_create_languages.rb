class CreateLanguages < ActiveRecord::Migration[7.1]
  def change
    create_table :languages do |t|
      t.string :name, null: false
      t.string :code, null: false, comment: 'ISO 639'
      t.string :flag, null: false

      t.timestamps
    end
    add_index :languages, :code, unique: true
  end
end
