 class CreateGeneralAnnouncements < ActiveRecord::Migration[7.1]
  def change
    create_table :general_announcements do |t|
      t.string :title, null: false
      t.text :body, null: false

      t.timestamps
    end
  end
end
