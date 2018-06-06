# frozen_string_literal: true

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
      render :edit
    end
  end

  private

  def recipe_params
    params.require(:recipe).permit(:id, :name, :instructions, recipe_ingredients_attributes:
                                                              %i(id ingredient_id recipe_id unit_amount))
  end
end
