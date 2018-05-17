class RecipeIngredientsController < ApplicationController

  def new
    @recipe = Recipe.find(params[:recipe_id])
    @recipe_ingredient = @recipe.recipe_ingredients.new
  end

  def create
    @recipe = Recipe.find(params[:recipe_id])
    @recipe_ingredient = @recipe.recipe_ingredients.build(recipe_ingredient_params)
    if @recipe_ingredient.save
      flash[:success] = 'Successfully added new ingredient'
      redirect_to @recipe
    else
      render :new
    end
  end

  def update
    @recipe_ingredient = RecipeIngredient.find(params[:id])
    if @recipe_ingredient.update
      redirect_to recipe_path(@recipe)
    else
      render :edit
    end
  end

  def destroy
    @recipe = Recipe.find(params[:recipe_id])
    @recipe_ingredient = RecipeIngredient.find(params[:id])
    @recipe_ingredient.destroy

    respond_to do |format|
      format.html { redirect_to @recipe }
      format.json { head :no_content }
      format.js   { render :layout => false }
    end
  end

  private

  def recipe_ingredient_params
    params.require(:recipe_ingredients).permit(:id, :ingredient_id, :recipe_id, :unit_amount)
  end
end
