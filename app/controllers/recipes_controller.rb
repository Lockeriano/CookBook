class RecipesController < ApplicationController
  def index
    @recipes = Recipe.all
  end

  def show
    @recipe = Recipe.find(params[:id])
  end

  def edit
    @recipe = Recipe.find(params[:id])
  end

  def update
    @recipe = Recipe.find(params[:id])
    if @recipe.update(recipe_params)
      flash[:success] = 'Recipe updated successfully'
      redirect_to recipe_path
    else
      render 'edit'
    end
  end

  private

  def recipe_params
    params.require(:recipe).permit(:name, :instructions, ingredients_attributes: [:id, :name, recipe_ingredients_attributes: [:id, :unit_amount]])
  end
end
