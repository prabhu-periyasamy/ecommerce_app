class AddTagsToPictures < ActiveRecord::Migration[6.1]
  def change
    add_column :pictures, :tags, :text
  end
end
