class RemoveRecipeIdAndUnitAmountFromIngridients < ActiveRecord::Migration[5.1]
  def change
    remove_column :ingridients, :recipe_id, :integer
    remove_column :ingridients, :unit_amount, :integer
  end
end
