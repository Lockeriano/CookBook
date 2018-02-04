class IngredientsController < ApplicationController
  def index
    @ingredients = Ingredient.all
  end

  def new
    @ingredient = Ingredient.new
  end

  def create
    @ingredient = Ingredient.new(ingredient_params)
    if @ingredient.save
      redirect_to ingredients_path
    else
      render action: 'new'
    end
  end

  private

  def ingredient_params
    params.require(:ingredient).permit(:name, :unit_type)
  end
end
