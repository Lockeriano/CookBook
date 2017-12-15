class Recipe < ApplicationRecord
  has_many :ingridients
  has_many :recipe_ingridients through: :ingridients
end
