# frozen_string_literal: true

class Recipe < ApplicationRecord
  validates :name, :instructions, presence: true
  validates :instructions, length: {minimum: 10}

  has_many :recipe_ingredients
  has_many :ingredients, through: :recipe_ingredients

  accepts_nested_attributes_for :recipe_ingredients,
    reject_if: proc { |attribute| attribute['unit_amount'].blank? }, allow_destroy: true
<<<<<<< HEAD

=======
>>>>>>> 3493392e9c57e5ea23e6d0d00276cf7a21ac4c9d
  validates_associated :recipe_ingredients
end
