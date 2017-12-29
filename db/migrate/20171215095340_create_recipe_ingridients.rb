class CreateRecipeIngridients < ActiveRecord::Migration[5.1]
  def change
    create_table :recipe_ingridients do |t|
      t.integer :recipe_id
      t.integer :ingridient_id
      t.integer :unit_amount

      t.timestamps
    end
    add_index :recipe_ingridients, [:recipe_id, :ingridient_id], unique: true
  end
end
