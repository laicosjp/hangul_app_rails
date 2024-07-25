class AddThumbnailUrlToCourses < ActiveRecord::Migration[7.1]
  def change
    add_column :courses, :thumbnail_url, :string
  end
end
