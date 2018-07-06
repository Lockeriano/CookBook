# frozen_string_literal: true

class RecipesController < ApplicationController
  before_action :find_recipe, except: [:index, :new, :create]

  def index
    @recipes = Recipe.all
  end

  def show; end

  def new
    @recipe = Recipe.new
    3.times { @recipe.recipe_ingredients.build }
  end
  
  def create
    @recipe = Recipe.new(recipe_params)
    if @recipe.save
      redirect_to @recipe
      flash[:success] = 'Successfully created a recipe'
    else
      render :new
    end
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
    end
  end

  private

  def recipe_params
    params.require(:recipe).permit(:id, :name, :instructions,
      recipe_ingredients_attributes: [:id, :ingredient_id, :recipe_id, :unit_amount, :_destroy])
  end

  def find_recipe
    @recipe = Recipe.find(params[:id])
  end
end
