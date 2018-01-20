class RecipeIngridient < ApplicationRecord
  validates :unit_amount, presence: true, numericality: {greater_than: 0, less_than: 1000}
  belongs_to :recipe
  belongs_to :ingridient

  accepts_nested_attributes_for :ingridient, allow_destroy: true
  delegate :name, :unit_type, to: :ingridient
end
