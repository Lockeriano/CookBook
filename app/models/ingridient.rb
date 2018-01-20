class Ingridient < ApplicationRecord
  validates :name, :unit_type, presence: true
  has_many :recipe_ingridients
  has_many :recipes, through: :recipe_ingridients
end
