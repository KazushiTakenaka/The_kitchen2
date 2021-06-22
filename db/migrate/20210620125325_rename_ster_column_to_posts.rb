class RenameSterColumnToPosts < ActiveRecord::Migration[5.2]
  def change
    rename_column :posts, :ster, :star
  end
end
