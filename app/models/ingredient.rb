class Ingredient < ApplicationRecord
  validates :name, :unit_type, presence: true, length: {minimum: 2}
  validates_uniqueness_of :name

  has_many :recipe_ingredients
  has_many :recipes, through: :recipe_ingredients
end
