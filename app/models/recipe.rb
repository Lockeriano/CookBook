class Recipe < ApplicationRecord
  has_many :recipe_ingridients
  has_many :ingridients, through: :recipe_ingridients
end
