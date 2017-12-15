class Ingridient < ApplicationRecord
  has_many :recipes
  has_many :recipe_ingridients
end
