class CreateCourses < ActiveRecord::Migration[7.1]
  def change
    create_table :courses do |t|
      t.string :slug, null: false
      t.string :title, null: false

      t.timestamps
    end
    add_index :courses, :slug, unique: true
  end
end
