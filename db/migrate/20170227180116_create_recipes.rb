class CreateRecipes < ActiveRecord::Migration[5.0]
  def change
    create_table :recipes do |t|
      t.string :name
      t.integer :serves
      t.string :cook_time
      t.string :difficult_level
      t.text :ingredients
      t.text :instructions

      t.timestamps
    end
  end
end
