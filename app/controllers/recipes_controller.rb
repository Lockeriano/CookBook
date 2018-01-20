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
    respond_to do |format|
      if @recipe.update(recipe_params)
        format.html { redirect_to @recipe }
      else
        format.html { render :edit }
      end
    end
  end

  private

  def recipe_params
    params.require(:recipe).permit(:id, :name, :instructions,
      recipe_ingridients_attributes: [:id, :recipe_id, :unit_amount, :_destroy, ingridient_attributes: [:id, :name, :unit_type]])
  end
end
