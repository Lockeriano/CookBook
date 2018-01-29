class RemoveRecipeIdAndUnitAmountFromIngredients < ActiveRecord::Migration[5.1]
  def change
    remove_column :ingredients, :recipe_id, :integer
    remove_column :ingredients, :unit_amount, :integer
  end
end
