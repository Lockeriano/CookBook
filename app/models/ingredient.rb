class Ingredient < ApplicationRecord
  validates :name, :unit_type, presence: true, uniqueness: true
  has_many :recipe_ingredients
  has_many :recipes, through: :recipe_ingredients
end
