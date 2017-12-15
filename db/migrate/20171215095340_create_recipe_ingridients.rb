class CreateRecipeIngridients < ActiveRecord::Migration[5.1]
  def change
    create_table :recipe_ingridients do |t|
      t.integer :recipe_id
      t.integer :ingridient_id
      t.integer :unit_amount

      t.timestamps
    end
  end
end
