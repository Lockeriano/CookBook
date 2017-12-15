class RecipeIngridient < ApplicationRecord
  belongs_to :recipe
  belongs_to :ingridient
end
