# frozen_string_literal: true

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
      flash[:success] = 'Ingredient created successfully'
      redirect_to ingredients_path
    else
      render :new
    end
  end

  def edit
    @ingredient = Ingredient.find(params[:id])
  end

  def update
    @ingredient = Ingredient.find(params[:id])
    if @ingredient.update(ingredient_params)
      flash[:success] = 'Ingredient updated successfully'
      redirect_to ingredients_path
    else
      render :edit
    end
  end

  def destroy
    @ingredient = Ingredient.find(params[:id])
    if @ingredient.destroy
      flash[:notice] = 'Ingredient was deleted'
      redirect_to ingredients_path
    else
      flash[:alert] = 'Ingredient cannot be deleted'
    end
  end

  private

  def ingredient_params
    params.require(:ingredient).permit(:id, :name, :unit_type)
  end
end
