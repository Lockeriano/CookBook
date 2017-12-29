class RecipeIngridient < ApplicationRecord
  belongs_to :recipe
  belongs_to :ingridient
  
  delegate :name, :unit_type, to: :ingridient
end
