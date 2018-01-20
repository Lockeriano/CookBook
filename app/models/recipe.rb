class Recipe < ApplicationRecord
  validates :name, :instructions, presence: true, length: {minimum: 3}
  has_many :recipe_ingridients
  has_many :ingridients, through: :recipe_ingridients

  accepts_nested_attributes_for :recipe_ingridients, allow_destroy: true
end
