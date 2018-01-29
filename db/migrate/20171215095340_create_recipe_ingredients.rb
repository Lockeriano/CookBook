class CreateRecipeIngredients < ActiveRecord::Migration[5.1]
  def change
    create_table :recipe_ingredients do |t|
      t.integer :recipe_id
      t.integer :ingredient_id
      t.integer :unit_amount

      t.timestamps
    end
    add_index :recipe_ingredients, [:recipe_id, :ingredient_id], unique: true
  end
end
