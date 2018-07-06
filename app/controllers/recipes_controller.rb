# frozen_string_literal: true

class RecipesController < ApplicationController
  before_action :find_recipe, except: %i(index new create)

  def index
    @recipes = Recipe.all
  end

  def show; end

  def new
    @recipe = Recipe.new
    3.times { @recipe.recipe_ingredients.build }
  end

<<<<<<< HEAD
  def new
    @recipe = Recipe.new
    3.times { @recipe.recipe_ingredients.build }
  end

=======
>>>>>>> 3493392e9c57e5ea23e6d0d00276cf7a21ac4c9d
  def create
    @recipe = Recipe.new(recipe_params)
    if @recipe.save
      redirect_to @recipe
      flash[:success] = 'Successfully created a recipe'
    else
      render :new
    end
<<<<<<< HEAD
  end

  def edit
    @recipe = Recipe.find(params[:id])
=======
>>>>>>> 3493392e9c57e5ea23e6d0d00276cf7a21ac4c9d
  end

  def edit; end

  def update
    if @recipe.update(recipe_params)
      flash[:success] = 'Recipe updated successfully'
      redirect_to recipe_path
    else
      render :edit
    end
  end

  def destroy
    if @recipe.destroy
      flash[:success] = 'Recipe deleted successfully'
      redirect_to recipes_path
    else
      flash[:alert] = 'Recipe cannot be delated'
    end
  end

  private

  def recipe_params
<<<<<<< HEAD
    params.require(:recipe).permit(:id, :name, :instructions, recipe_ingredients_attributes:
                                                              %i(id ingredient_id recipe_id unit_amount _destroy))
=======
    params.require(:recipe).permit(:id, :name, :instructions,
      recipe_ingredients_attributes: %i(id ingredient_id recipe_id unit_amount _destroy))
  end

  def find_recipe
    @recipe = Recipe.find(params[:id])
>>>>>>> 3493392e9c57e5ea23e6d0d00276cf7a21ac4c9d
  end
end
