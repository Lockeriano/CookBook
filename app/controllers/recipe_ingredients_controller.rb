# frozen_string_literal: true
class RecipeIngredientsController < ApplicationController
  before_action :find_recipe, except: [:new]

  def new
    @recipe_ingredient = RecipeIngredient.new
  end

  def create
    @recipe_ingredient = @recipe.recipe_ingredients.build(recipe_ingredient_params)
    if @recipe_ingredient.save
      flash[:success] = 'Successfully added new ingredient'
      redirect_to @recipe
    else
      render :new
    end
  end

  def update
    @recipe_ingredient = @recipe.recipe_ingredients.find(params[:id])
    if @recipe_ingredient.update(recipe_ingredient_params)
      redirect_to recipe_path(@recipe)
    else
      render :edit
    end
  end

  def destroy
    @recipe_ingredient = @recipe.recipe_ingredients.find(params[:id])
    @recipe_ingredient.destroy
    respond_to do |format|
      format.html { redirect_to @recipe }
      format.js
    end
  end

  private

  def find_recipe
    @recipe = Recipe.find(params[:recipe_id])
  end

  def recipe_ingredient_params
    params.require(:recipe_ingredient).permit(:id, :ingredient_id, :recipe_id, :unit_amount)
  end
end
