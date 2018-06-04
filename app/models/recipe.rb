# frozen_string_literal: true
class Recipe < ApplicationRecord
  validates :name, :instructions, presence: true
  validates :instructions, length: {minimum: 10}

  has_many :recipe_ingredients
  has_many :ingredients, through: :recipe_ingredients

  accepts_nested_attributes_for :recipe_ingredients
  validates_associated :recipe_ingredients
end
