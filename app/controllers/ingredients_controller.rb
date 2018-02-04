class IngredientsController < ApplicationController
  def index
    @ingredients = Ingredient.all
  end

  def new
    @ingredient = Ingredient.new
  end

  def create
    @ingredient = Ingredient.new(ingredient_params)
    respond_to do |format|
      if @ingredient.save
        format.html { redirect_to ingredients_path }
      else
        format.html { render action: 'new' }
      end
    end
  end

  private

  def ingredient_params
    params.require(:ingredient).permit(:name, :unit_type)
  end
end
