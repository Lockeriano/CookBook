class RecipeIngredient < ApplicationRecord
  belongs_to :recipe
  belongs_to :ingredient

  delegate :name, :unit_type, to: :ingredient, allow_nil: true
end
