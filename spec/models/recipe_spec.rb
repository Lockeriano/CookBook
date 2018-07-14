require 'rails_helper'

RSpec.describe Recipe, type: :model do
  context 'validation tests' do
    it 'ensures recipe\'s name presence' do
      recipe = Recipe.new(instructions: 'example instructions').save
      expect(recipe).to eq(false)
    end

    it 'ensures recipe\'s instructions presence' do
      recipe = Recipe.new(name: 'example name').save
      expect(recipe).to eq(false)
    end

    it 'ensures recipe\'s instructions length' do
      recipe = Recipe.new(name: 'example name', instructions: 'ex').save
      expect(recipe).to eq(false)
    end

    it 'should save sucessfully' do
      recipe = Recipe.new(name: 'example name', instructions: 'example instructions').save
      expect(recipe).to eq(true)
    end
  end
end
