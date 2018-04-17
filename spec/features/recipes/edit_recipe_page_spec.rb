require 'pry'

feature 'user visits edit recipe page' do
  let!(:recipe) { FactoryBot.create(:recipe, :scrambled_eggs) }

  before do
    FactoryBot.create(:ingredient, :tikka)
    FactoryBot.create(:ingredient, :soy_sauce)
    visit('/recipes')
    click_link 'Show'
  end

  context 'user provides valid params' do
    before do
      click_link 'Edit'
      fill_in('recipe_name', with: 'test recipe name')
      fill_in('recipe_instructions', with: 'test instructions')
      page.select('tikka', from: 'recipe_recipe_ingredients_attributes_0_ingredient_id')
      fill_in('recipe_recipe_ingredients_attributes_0_unit_amount', with: '50')
      click_button 'Save'
    end

    it 'successfully updates recipe' do
      expect(page).to have_current_path(recipe_path(recipe))
      expect(page).to have_content('test recipe name')
      expect(page).to have_content('test instructions')
      expect(page).to have_content('tikka')
      expect(page).to have_content('50')
    end
  end
end
