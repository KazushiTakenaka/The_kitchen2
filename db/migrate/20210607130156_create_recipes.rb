class CreateRecipes < ActiveRecord::Migration[5.2]
  def change
    create_table :recipes do |t|
      t.integer :user_id
      t.integer :time
      t.string :name

      t.timestamps
    end
  end
end
