require 'rails_helper'

RSpec.describe Recipe, type: :model do
  let(:recipe_attributes) do
    { name: 'example name', instructions: 'example instructions', image: File.new("#{Rails.root}/spec/support/fixtures/correct-image.jpeg") }
  end
  let(:recipe) { Recipe.new(recipe_attributes) }

  context 'when recipe does not have name' do
    before { recipe_attributes.delete(:name) }

    it 'does not allow to save recipe without name' do
      expect(recipe).to be_invalid
      expect(recipe.errors[:name]).to eq ['can\'t be blank']
    end
  end

  context 'when recipe does not have instructions' do
    before { recipe_attributes.delete(:instructions) }

    it 'does not allow to save recipe without instructions' do
      expect(recipe).to be_invalid
      expect(recipe.errors[:instructions]).to eq ['is too short (minimum is 10 characters)']
    end
  end

  context 'when recipe have incorrect image' do
    before { recipe_attributes[:image] = File.new("#{Rails.root}/spec/support/fixtures/incorrect-image.jpg") }
    it 'does not allow to save recipe with incorrect image' do

      expect(recipe).to be_invalid
      expect(recipe.errors[:image]).to eq ['minimum width: 250px, minimum height: 250px']
    end
  end

  context 'when recipe attributes are valid' do
    it { expect(recipe).to be_valid }
  end
end
