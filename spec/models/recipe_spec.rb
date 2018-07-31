require 'rails_helper'

RSpec.describe Recipe, type: :model do
  let(:recipe) do
    Recipe.new(
      name: 'example name',
      instructions: 'example instructions',
      image: File.new("#{Rails.root}/spec/support/fixtures/correct-image.jpeg")
    )
  end

  context 'validation' do
    it 'ensures recipe\'s name presence' do
      recipe = Recipe.new(instructions: 'example instructions')
      expect(recipe).to be_invalid
    end

    it 'ensures recipe\'s instructions presence' do
      recipe = Recipe.new(name: 'example name')
      expect(recipe).to be_invalid
    end

    it 'ensures recipe\'s instructions length' do
      recipe = Recipe.new(name: 'example name', instructions: 'ex')
      expect(recipe).to be_invalid
    end

    it 'ensures recipe\'s image dimensions' do
      recipe = Recipe.new(
        name: 'example name',
        instructions: 'example instructions',
        image: File.new("#{Rails.root}/spec/support/fixtures/incorrect-image.jpg")
      )
      expect(recipe).to be_invalid
    end

    it { expect(recipe).to be_valid }
  end
end
