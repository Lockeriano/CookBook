# frozen_string_literal: true
class Ingredient < ApplicationRecord
  validates :name, :unit_type, presence: true, length: {minimum: 2}
  validates_uniqueness_of :name

  has_many :recipe_ingredients, dependent: :destroy
  has_many :recipes, through: :recipe_ingredients

  accepts_nested_attributes_for :recipe_ingredients
end
