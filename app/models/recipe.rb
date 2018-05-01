# frozen_string_literal: true
class Recipe < ApplicationRecord
  validates :name, :instructions, presence: true
  validates :instructions, length: {minimum: 10}

  has_many :recipe_ingredients
  has_many :ingredients, through: :recipe_ingredients

  accepts_nested_attributes_for :ingredients, :recipe_ingredients, allow_destroy: true
  validates_associated :ingredients, :recipe_ingredients
end
