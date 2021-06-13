class CreateMakes < ActiveRecord::Migration[5.2]
  def change
    create_table :makes do |t|
      t.integer :recipe_id
      t.text :method

      t.timestamps
    end
  end
end
