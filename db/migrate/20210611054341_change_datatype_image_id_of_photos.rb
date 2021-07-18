class ChangeDatatypeImageIdOfPhotos < ActiveRecord::Migration[5.2]
  def change
    change_column :photos, :image_id, :string
  end
end
