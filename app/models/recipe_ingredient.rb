# frozen_string_literal: true
class RecipeIngredient < ApplicationRecord
  validates :unit_amount, presence: true, numericality: {greater_than: 0}

  belongs_to :recipe
  belongs_to :ingredient

  delegate :name, :unit_type, to: :ingredient
end
