# frozen_string_literal: true
class Recipe < ApplicationRecord
  validates :name, :instructions, presence: true
  validates :instructions, length: {minimum: 10}

  has_many :recipe_ingredients
  has_many :ingredients, through: :recipe_ingredients

<<<<<<< HEAD
  accepts_nested_attributes_for :recipe_ingredients,
    reject_if: proc { |attribute| attribute['unit_amount'].blank? }, allow_destroy: true

=======
  accepts_nested_attributes_for :recipe_ingredients, reject_if: proc { |attribute| attribute['unit_amount'].blank? }, allow_destroy: true
>>>>>>> 5b501cab17e6d02b139cf3229a551aabd28eee67
  validates_associated :recipe_ingredients
end
